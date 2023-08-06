import 'package:blog_club/article.dart';
import 'package:blog_club/splash.dart';
import 'package:flutter/material.dart';
// import 'package:blog_club/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Club',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF4F7FF)),
        colorScheme: const ColorScheme.light(
            primary: Color(0xFF376AED),
            shadow: Color(0x700C243C),
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            onBackground: primaryTextColor,
            background: Color(0xFFF4F7FF)),
        primarySwatch: Colors.blue,
        fontFamily: 'Avenir',
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Color(0xFF2D4379),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            titleLarge: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            titleSmall: TextStyle(
              color: Color(0xFF0D253C),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
            headlineSmall: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w400,
            ),
            headlineMedium: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
            headlineLarge: TextStyle(
              color: Color(0xFF376AED),
              fontSize: 14,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w800,
            ),
            bodyLarge: TextStyle(
                color: Color(0xFF2D4379),
                fontSize: 14,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(
              color: primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(
              color: Color(0xFF2D4379),
              fontSize: 12,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w500,
            )),
      ),
      home: const SplashScreen(),
    );
  }
}
