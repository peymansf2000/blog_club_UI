import 'package:blog_club/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Club',
      theme: ThemeData(
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
