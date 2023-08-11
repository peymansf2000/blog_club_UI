import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(physics: const BouncingScrollPhysics(),
          child: Column(
        children: [
          AppBar(
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.ellipsis)),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/stories/story_4.jpg',
                            width: 66,
                            height: 66,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@joviedan',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'Jovi Daniel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontSize: 18),
                                ),
                                Text(
                                  'UX Designer',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                )
                              ])
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'About me',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: -33,
                  left: 44,
                  right: 44,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0, 20),
                                  spreadRadius: -20,
                                  blurRadius: 30,
                                  color: Color(0xFF0C243C)),
                            ],
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                        height: 68,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF2151CD),
                                  borderRadius: BorderRadius.circular(12)),
                              width: 77,
                              height: 66,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Post',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 77,
                              height: 66,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Folowing',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 77,
                              height: 66,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Followers',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Posts',style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),),
                      const Row(children: [Icon(Icons.list,size: 28),SizedBox(width: 24),Icon(Icons.apps)])
                        
                      ],
                    ),
                  ),
                  _PostList(),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      color: Color(0x225182FF),
                      blurRadius: 32,
                      // offset: Offset(0, 10),
                      spreadRadius: 5,
                    )
                  ]))
        ],
      )),
    ));
  }
}

class _PostList extends StatelessWidget {
  _PostList({
    Key? key,
  }) : super(key: key);
  final List<PostData> posts = AppDatabase.posts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 141,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => _Post(post: posts[index]),
        itemCount: posts.length);
  }
}

class _Post extends StatelessWidget {
  const _Post({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostData post;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: 91,
                height: 91,
                child: Image.asset(
                  'assets/img/posts/small/${post.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.caption,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                  child: SizedBox(
                    width: 163,
                    child: Text(
                      post.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.hand_thumbsup, size: 16),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(post.likes,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      CupertinoIcons.time,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      post.time,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 33,
                    ),
                    post.isBookmarked
                        ? const Icon(CupertinoIcons.bookmark_fill, size: 16)
                        : const Icon(CupertinoIcons.bookmark, size: 16)
                  ],
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Container(
          width: 315,
          height: 141,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Color(0x0F5182FF),
                blurRadius: 15,
                offset: Offset(0, 10),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
