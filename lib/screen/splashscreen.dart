import 'dart:async';
import 'package:challenge/screen/home_screen.dart';
import 'package:challenge/screen/login.dart';
import 'package:challenge/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_bloc.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goOnboarding() {
    Timer(const Duration(seconds: 1), () {
      nextScreen(context, const LoginScreen());
    });
  }


  Future _splashEnd() async {
    final LogInBloc lb = context.read<LogInBloc>();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      lb.checkSignIn();
      lb.getLoggedInToken();
      lb.isSignedIn == true && lb.token?.isNotEmpty == true
          ? _gotoHomePage()
          : goOnboarding();
    });
  }

  @override
  void initState() {
    super.initState();
    _splashEnd();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width + width * 0.4,

        child: Stack(
          children: <Widget>[
            Image.asset("assets/images/splash.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }

  _gotoHomePage() {
    nextScreenReplace(context, const HomeScreen());
  }
}
