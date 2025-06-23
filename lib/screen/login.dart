import 'dart:convert';

import 'package:challenge/screen/home_screen.dart';
import 'package:challenge/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../network/network_utils.dart';
import '../providers/login_bloc.dart';
import '../utils/animate_controller.dart';
import '../utils/colors.dart';
import '../utils/next_screen.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var userNameCont = TextEditingController();
  var passwordCont = TextEditingController();
  var usernameNode = FocusNode();
  var passwordNode = FocusNode();
  bool _isObscure = true;
  bool isLoading = false;
  bool rememberState = false;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: AnimateWidget(),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
                left: _screenWidth * 0.07, right: _screenWidth * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _screenHeight * .049,
                ),
                Container(
                    child: Image.asset(
                      'assets/images/logos.png',
                      height: MediaQuery.of(context).size.height * 0.051,
                      //width: _screenWidth * .26,
                    )),
                SizedBox(
                  height: _screenHeight * 0.1,
                ),

                // Text("Login", style: TextStyle(color: appColorPrimary, fontSize: textSizeLarge),),

                Text(
                  "Enter your email & Password to continue",
                  style: GoogleFonts.poppins(
                    color: const Color(0xff8D93A1),
                    fontWeight: FontWeight.w400,
                    fontSize: _screenHeight * .015,
                  ),
                ),
                SizedBox(
                  height: _screenHeight * 0.0285,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      zercomFormField(
                        context: context,
                        controller: userNameCont,
                        focusNode: usernameNode,
                        hintText: "Enter Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (s) {
                          if (s!.isEmpty) return 'Email is required';
                          return null;
                        },
                        onFieldSubmitted: (s) =>
                            FocusScope.of(context).requestFocus(passwordNode),
                      ),
                      SizedBox(
                        height: _screenHeight * 0.03,
                      ),
                      zercomFormFieldPWD(
                        context: context,
                        controller: passwordCont,
                        focusNode: passwordNode,
                        hintText: "Enter Password",
                        keyboardType: TextInputType.text,
                        showPass: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        validator: (s) {
                          if (s!.isEmpty) return 'Password is required';
                          return null;
                        },
                        isObscure: _isObscure,
                      ),
                      SizedBox(
                        height: _screenHeight * 0.03,
                      ),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberState,
                                activeColor: appColorPrimary,
                                checkColor: appColorAccent,
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                onChanged: (value) {
                                  if (value!) {
                                  } else {
                                  }
                                  setState(() {
                                    rememberState = !rememberState;
                                  });
                                },
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColorPrimary,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: _screenHeight * 0.25,
                      ),

                      Center(
                        child: Container(
                          height: _screenHeight * .0633,
                          width: _screenWidth * .965,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: appColorPrimary,
                          ),
                          child: InkWell(
                              onTap: () {
                                loginIn();
                              },
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.poppins(
                                    color: appWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: _screenHeight * .017,
                                    //fontSize: _width * .0376,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: _screenHeight * .043,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            width: double.infinity,
            height: _screenHeight * .07,
            //margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
            // decoration: BoxDecoration(
            //   border:
            // ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.13)))),
            child: Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.07, top: _screenHeight * .001),
              child: Row(
                children: [
                  Text(
                    "Don’t have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: _screenHeight * .015,
                      color: appColorPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, const RegisterScreen());
                    },
                    child: Text(
                      " Register",
                      style: GoogleFonts.poppins(
                        fontSize: _screenHeight * .015,
                        color: appColorPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  loginIn() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      final LogInBloc lb = Provider.of<LogInBloc>(context, listen: false);

      Map req = {
        "email": userNameCont.text,
        "password": passwordCont.text,
      };

      ///account/api/v1/login
      await postRequest('/api/v1/users/login', req).then((value) {
        print(value.body);
        if (value.statusCode.isSuccessful()) {
          var data = jsonDecode(value.body);
          print(data['token']);
          lb.saveLoggedInToken(data['token']);
          lb.setSignIn();
          showSnackBar(context, "You are Successfully Logged In");
          setState(() {
            isLoading = false;
          });

          nextScreenCloseOthers(context, const HomeScreen());
        } else {
          if (value.body.isJson()) {
            var data = jsonDecode(value.body);
            dmsNotice(context, "Login Failed: Incorrect Username or password");
            setState(() {
              isLoading = false;
            });
          }
        }
      }).catchError((e) {
        isLoading = false;
        dmsNotice(
            context, "We are unable to complete your request at this time");
        print(e.toString());
        setState(() {});
      });
    } else {
      isLoading = false;
      setState(() {});
    }
  }
}
