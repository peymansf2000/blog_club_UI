import 'package:blog_club/auth.dart';
import 'package:blog_club/data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page?.round() != page) {
        setState(() {
          page = pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset('assets/img/background/onboarding.png')),
          Container(
            height: 280,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Color(0x445182FF),
                    blurRadius: 33,
                    spreadRadius: 0,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PageView(
                  items: items,
                  controller: pageController,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          controller: pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              dotColor: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.3),
                              activeDotColor:
                                  Theme.of(context).colorScheme.primary)),
                      ElevatedButton(
                          onPressed: () {
                            page == items.length - 1
                                ? Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const AuthScreen(),
                                  ))
                                : pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                          },
                          child: page == items.length - 1
                              ? const Icon(CupertinoIcons.checkmark)
                              : const Icon(
                                  CupertinoIcons.arrow_right,
                                  size: 22,
                                )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}

class _PageView extends StatelessWidget {
  const _PageView({
    Key? key,
    required this.items,
    required this.controller,
  }) : super(key: key);

  final List<OnBoardingItem> items;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemBuilder: (context, index) => _Page(item: items[index]),
        itemCount: items.length,
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key? key,
    required this.item,
  }) : super(key: key);
  final OnBoardingItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(item.description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
