import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'color_constants.dart';
import 'colors.dart';


class AppThemeData {
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF0F0FF),
    primaryColor: appColorPrimary,
    primaryColorDark: const Color(0xFF1E1E1E),
    highlightColor: appTextColorSecondary,
    hoverColor: Colors.white54,
    dividerColor: appTextColorSecondary,
    cardColor: appColorAccent,
    fontFamily: GoogleFonts.nunito().fontFamily,
    appBarTheme: const AppBarTheme(
      color: appLayout_background,
      iconTheme: IconThemeData(color: iconColorPrimary),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, ),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    // colorScheme: ColorScheme.light(primary: appColorPrimary, primaryVariant: appColorPrimary),
      unselectedWidgetColor: appLayout_background,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                fontSize: 16, fontFamily: "BarlowCondensed")),
            overlayColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
            foregroundColor:
            MaterialStateProperty.all<Color>(appColorPrimaryDark)),
      ),
    cardTheme: const CardTheme(color: Colors.white),
    iconTheme: const IconThemeData(color: appTextColorPrimary),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: appWhite),
      buttonTheme: const ButtonThemeData(
          buttonColor: appColorPrimary,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: appTextColorPrimary),
      bodyMedium: TextStyle(color: appTextColorPrimary),
      labelLarge: TextStyle(color: appColorPrimary),
      displayLarge: TextStyle(color: appTextColorPrimary),
      displayMedium: TextStyle(color: appTextColorPrimary),
      headlineLarge: TextStyle(color: appTextColorPrimary),
      displaySmall: TextStyle(color: appTextColorPrimary),
      headlineMedium: TextStyle(color: appTextColorPrimary),
      titleMedium: TextStyle(color: appTextColorPrimary),
      titleLarge: TextStyle(color: appTextColorPrimary),
      titleSmall: TextStyle(color: appTextColorSecondary),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: appDark_parrot_green,
          onPrimary: appWhite,
          secondary: appWhite,
          onSecondary: appColorPrimaryDark,
          error: appLight_google_red,
          onError: appWhite,
          background: appWhite,
          onBackground: appColorPrimaryDark,
          surface: appWhite,
          onSurface: appColorPrimaryDark,
      ).copyWith(error: Colors.red),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    highlightColor: appBackgroundColorDark,
    appBarTheme: const AppBarTheme(
      color: appBackgroundColorDark,
      iconTheme: IconThemeData(color: Colors.black54),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    primaryColor: color_primary_black,
    hintColor: appWhite,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: color_primary_black,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.nunito().fontFamily,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(titleLarge: primaryTextStyle(color: Colors.white), labelSmall: primaryTextStyle(color: Colors.white)),
    cardTheme: const CardTheme(color: cardBackgroundBlackDark),
    iconTheme: const IconThemeData(color: appWhite),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: color_primary_black),
      titleLarge: TextStyle(color: whiteColor),
      titleSmall: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: const ColorScheme.dark(primary: appBackgroundColorDark, onPrimary: cardBackgroundBlackDark).copyWith(error: const Color(0xFFCF6676)),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    }),
  );

  static final ThemeData adminDarkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: bgColor, elevation: 0),
    scaffoldBackgroundColor: bgColor,
    primaryColor: const Color(0xFF6bab58),
    dialogBackgroundColor: secondaryColor,
    textTheme: GoogleFonts.openSansTextTheme()
        .apply(bodyColor: Colors.white),
    canvasColor: secondaryColor,
  );

}
