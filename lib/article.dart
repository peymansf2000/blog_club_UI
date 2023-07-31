import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: const ButtonStyle(
          maximumSize: MaterialStatePropertyAll(
            Size(111, 48),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size(111, 48),
          ),
        ),
        onPressed: () {
showSnacBar(context, 'Like butten is clicked');
        },
        child: const Row(
          children: [
            SizedBox(
              width: 6,
            ),
            Icon(CupertinoIcons.hand_thumbsup),
            SizedBox(
              width: 8,
            ),
            Text(
              '2.1k',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Stack(children: [
        SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 32,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.ellipsis,
                        size: 32,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text(
                'Four Things Every Woman Needs To Know',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/img/stories/story_4.jpg',
                      width: 38,
                      height: 38,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Richard Gervain',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(
                        '2m ago',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Color(0xFF7B8BB2),
                              fontWeight: FontWeight.w400,
                            ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  IconButton(onPressed:(){ showSnacBar(context, 'Share button is clicked'); } ,icon:Icon(CupertinoIcons.share, color: Colors.blue)),
                  SizedBox(
                    width: 7,
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.bookmark,
                      color: Colors.blue,
                    ), onPressed: () { showSnacBar(context, 'Bookmark button is clicked'); },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
                child: Image.asset(
                  'assets/img/background/single_post.png',
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 16),
              child: Text(
                "A man’s sexuality is never your mind responsibility.",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text(
                "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        )),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 116,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.surface.withOpacity(0),
              ],
            )),
          ),
        ),
      ])),
    );
  }
  void showSnacBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
