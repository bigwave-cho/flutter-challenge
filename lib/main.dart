import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/challenge/features/authentication/initial_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/c_main_navigation.dart';
import 'package:tiktok/challenge/features/onboarding/interests_screen.dart';
import 'package:tiktok/challenge/features/video/photo_screen.dart';
import 'package:tiktok/challenge/features/video/video_screen.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/sign_up_screen.dart';
import 'package:tiktok/features/main_navigation/main_navigation.dart';

import 'package:tiktok/features/onboarding/interests_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        // material 3 강제적용
        useMaterial3: true,

        brightness: Brightness.light,
        primaryColor: const Color(0xffe9435a),
        //https://m2.material.io/design/typography/the-type-system.html#type-scale
        //https://m3.material.io/styles/typography/type-scale-tokens
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: Sizes.size24,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: const Color(0xffe9435a),
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteCupertino,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade800,
        ),
      ),
      // home: const InitialScreen(),
      // home: const SignUpScreen(),
      // home: const MainNavigation(),
      home: const CMainNavigation(),
      // home: const PhotoScreen(),
    );
  }
}
