import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'app_logo.dart';

AppBar displayMobileAppBar(
    final BuildContext context,
    {
      final List<Widget>? actions,
      required final bool showBack,
      required final bool isImage,
      final Color? color,
      final Color? iconColor,
      final Color? textColor,
      final VoidCallback? onClose,
      required final bool showAction,
      required GlobalKey<ScaffoldState> scaffoldKey,
      bool isDrawerOpened = false,
    }){

  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return AppBar(
    toolbarHeight: screenHeight * .07,
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: appWhite,
    title: const AppLogo(),
    actions: !showAction
        ? null
        : [
      IconButton(
          onPressed: () {},
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/icons/user.png",
              height: 30,
              width: 30,
            ),
          )),
      IconButton(
        onPressed: () {},
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
              "assets/icons/globe.png",
              fit: BoxFit.cover,
            height: 30,
            width: 30,
          ),
        ),),
    ],
  );

}