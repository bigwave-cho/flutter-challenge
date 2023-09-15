import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/challenge/features/profile/repo/darkmode_repo.dart';
import 'package:tiktok/challenge/features/profile/view_models/darkmode_config_vm.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/nvvm_with_provider/repo/config_repository.dart';
import 'package:tiktok/nvvm_with_provider/view_models/config_vm.dart';

import 'package:tiktok/router.dart';
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final darkmodeRepository = DarkmodeRepository(preferences);
  final configRepository = ConfigRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => DarkModeConfigViewModel(darkmodeRepository),
        // ),
        ChangeNotifierProvider(
          create: (context) => ConfigViewModel(configRepository),
        ),
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'TikTok clone',
      themeMode: context.watch<DarkModeConfigViewModel>().isDark
          ? ThemeMode.dark
          : ThemeMode.light,
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
      // home: const CMainNavigation(),
      // home: const PhotoScreen(),
    );
  }
}
*/