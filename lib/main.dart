import 'package:flutter/material.dart';
import 'package:tiktok/challenge/features/authentication/initial_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/c_main_navigation.dart';
import 'package:tiktok/challenge/features/onboarding/interests_screen.dart';
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
      theme: ThemeData(
        primaryColor: const Color(0xffe9435a),
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
      // home: const InitialScreen(),
      // home: const SignUpScreen(),
      home: const MainNavigation(),
      // home: const CMainNavigation(),
    );
  }
}
