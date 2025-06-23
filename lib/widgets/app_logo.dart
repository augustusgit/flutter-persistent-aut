import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Image.asset(
        "assets/images/logos.png",
        height: 33,
        width: 158,
      ),
    );
  }
}
