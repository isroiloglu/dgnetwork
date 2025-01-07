import 'package:dgnetwork/core/const.dart';
import 'package:dgnetwork/ui/screens/bottom_nav_bar_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("posts/").push();
  TextEditingController controllerPost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create post',
          style: TextStyle(fontSize: 18),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              'Publish',
              style: TextStyle(color: Color(0xff3873E9)),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 16),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    width: 32,
                    fit: BoxFit.cover,
                    height: 32,
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
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
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: controllerPost,
              decoration: const InputDecoration(
                  hintText: 'What do you want to talk about?',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.photo,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.smiley,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    if (controllerPost.text.isNotEmpty) {
                      await ref.set({
                        "author": name,
                        "author_userName": userName,
                        "body": controllerPost.text,
                        "likes_count": 0,
                        "commentaries": [],
                        "created_at": DateFormat('HH:mm, MMM d yyyy')
                            .format(DateTime.now())
                      });

                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                BottomNavBarPage(),
                          ),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xff3873E9),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      'Publish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
