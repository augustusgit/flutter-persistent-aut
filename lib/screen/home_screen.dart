import 'package:challenge/providers/login_bloc.dart';
import 'package:challenge/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/next_screen.dart';
import '../widgets/display_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LogInBloc lb = LogInBloc();

  @override
  void initState() {
     lb = Provider.of<LogInBloc>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: displayMobileAppBar(context, isImage: true, showAction: true, showBack: false, scaffoldKey: _scaffoldKey),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulation!! You are Now Logged In.",
              style: GoogleFonts.poppins(
                fontSize: height * .025,
                fontWeight: FontWeight.w500,
                // color: const Color(0xff7A7C85),
              ),
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
                      // register();
                      lb.userSignout().then((value) => { nextScreenCloseOthers(context, const LoginScreen()), });
                    },
                    child: Center(
                      child: Text(
                        "Sign Out",
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
          ],
        ),
    );
  }
}
