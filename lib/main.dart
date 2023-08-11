import 'package:blog_club/article.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/profile.dart';
import 'package:blog_club/search.dart';
import 'package:blog_club/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:blog_club/onboarding.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF4F7FF),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFF4F7FF),
      systemNavigationBarIconBrightness: Brightness.dark));
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
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF4F7FF)),
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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedIndex = 0;
const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            HomeScreen(),
            ArticleScreen(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: _BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final Function(int index) onTap;

  const _BottomNavigationBar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Color(0x242C2C2C),
              blurRadius: 20,
              offset: Offset(0, -3),
              spreadRadius: 0,
            ),
          ]),
          height: 75,
          child: Row(
            children: [
              _BottomNavigationItem(
                name: 'Home',
                icon: Icons.home,
                onTap: () {
                  onTap(homeIndex);
                },
                active: selectedIndex == homeIndex,
              ),
              _BottomNavigationItem(
                name: 'Articles',
                icon: Icons.article_outlined,
                onTap: () {
                  onTap(articleIndex);
                },
                active: selectedIndex == articleIndex,
              ),
              const SizedBox(
                width: 40,
              ),
              _BottomNavigationItem(
                name: 'Search',
                icon: Icons.search,
                onTap: () {
                  onTap(searchIndex);
                },
                active: selectedIndex == searchIndex,
              ),
              _BottomNavigationItem(
                name: 'Menu',
                icon: Icons.menu,
                onTap: () {
                  onTap(profileIndex);
                },
                active: selectedIndex == profileIndex,
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          child: Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                shape: BoxShape.circle,
                color: const Color(0xFF376AED)),
            child: const Icon(CupertinoIcons.plus, color: Colors.white, size: 26),
          ),
        ),
      ],
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  const _BottomNavigationItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
    required this.active,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final Function() onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: active ? const Color(0xFF0047CC) : const Color(0xFF7B8BB2),
              size: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF7B8BB2),
                fontSize: 10,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w800,
                letterSpacing: 0.12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
