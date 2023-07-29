import 'package:blog_club/data.dart';
// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
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
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: primaryTextColor),
            bodyMedium: TextStyle(
              color: secondaryTextColor,
              fontSize: 12,
            )),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<StoryData> stories = AppDatabase.stories;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Color(0xFFF4F7FF)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 25, 40, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hi, Jonathan!',
                            style: Theme.of(context).textTheme.titleMedium),
                        Image.asset(
                          'assets/img/icons/notification.png',
                          width: 32,
                          height: 32,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                    child: Text('Explore today\'s',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  _StoryList(stories: stories),
                  const SizedBox(
                    height: 12,
                  ),
                  _CategoryList(),
                ],
              )),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  _CategoryList({
    Key? key,
  }) : super(key: key);

  final category = AppDatabase.categories;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) =>
          _Category(category: category[index]),
      options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          scrollPhysics: const BouncingScrollPhysics(),
          disableCenter: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height),
      itemCount: category.length,
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
            width: 175,
            decoration: BoxDecoration(
                boxShadow: List.filled(
                    1,
                    BoxShadow(
                        offset: Offset(-18, -18),
                        blurRadius: 25,
                        color: Color(0x770D253C))))),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
        // decoration: BoxDecoration(),
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              colors: [Color(0xFF0D253C), Color(0x000D253C)],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.asset(
            'assets/img/posts/large/${category.imageFileName}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        left: 38,
        bottom: 54,
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ]);
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 92,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _Story(story: stories[index]);
          },
        ),
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Stack(children: [
              Container(
                // margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                        Color(0xFF376AED),
                        Color(0xFF49B0E2),
                        Color(0xFF9CECFB)
                      ]),
                      width: 2,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    'assets/img/stories/${story.imageFileName}',
                    width: 54,
                    height: 54,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: Image.asset('assets/img/icons/${story.iconFileName}'),
                ),
              )
            ]),
            const SizedBox(
              height: 6,
            ),
            Text(story.name)
          ],
        ),
      ),
    );
  }
}
