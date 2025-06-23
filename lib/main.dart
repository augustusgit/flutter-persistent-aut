import 'dart:ui';

import 'package:challenge/providers/login_bloc.dart';
import 'package:challenge/screen/home_screen.dart';
import 'package:challenge/screen/login.dart';
import 'package:challenge/screen/register_screen.dart';
import 'package:challenge/screen/splashscreen.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EncryptedSharedPreferences.initialize("7r0q82EeFfG19gHh");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<LogInBloc>(
                  create: (context) => LogInBloc()),
            ],
            child: MaterialApp(
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown, PointerDeviceKind.trackpad, PointerDeviceKind.invertedStylus},
              ),
              debugShowCheckedModeBanner: false,
              title: "Zercom",
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.adminDarkTheme,
              themeMode: currentMode,
              home: const SplashScreen(),
            ),
          );
        }
    );
  }
}
