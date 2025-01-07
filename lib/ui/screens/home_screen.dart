import 'dart:developer';

import 'package:dgnetwork/core/const.dart';
import 'package:dgnetwork/ui/widgets/post.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('posts/');
  List<String> authors = [];
  List<String> authorsUsernames = [];
  List<String> bodies = [];
  List<String> createdAT = [];
  List<int> likes = [];

  @override
  void initState() {
    ref.onValue.listen((DatabaseEvent event) {
      if (mounted) {
        setState(() {
          for (final child in event.snapshot.children) {
            log('==DATA IS ${child.value}');
            final map = child.value as Map;
            authors.add(map['author']);
            authorsUsernames.add(map['author_userName']);
            bodies.add(map['body']);
            createdAT.add(map['created_at']);
            likes.add(map['likes_count']);
          }
        });
      }
    }, onError: (error) {
      // Error.
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffDBEAFF),
        Color(0xffddceff),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/profil.png',
                  width: 32,
                  height: 32,
                ),
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning, $name!',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    '@$userName',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
          actions: [
            Container(
              height: 28,
              width: 28,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: const Icon(
                CupertinoIcons.bell_fill,
                size: 20,
                color: Colors.blue,
              ),
            )
          ],
        ),
        body: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: authors.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Post(
                    author: authors[i],
                    body: bodies[i],
                    author_username: authorsUsernames[i],
                    created_at: createdAT[i],
                    likesCount: likes[i],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
