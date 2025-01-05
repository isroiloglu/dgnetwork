import 'package:dgnetwork/ui/widgets/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          centerTitle: false,
          title: Container(
            height: 28,
            width: 28,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.white,
                )),
            child: const Icon(
              Icons.edit,
              size: 18,
              color: Colors.blue,
            ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.network(
                          height: 102,
                          fit: BoxFit.cover,
                          width: 120,
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alexandar Simonic',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '3D artist, Visual designer ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff646464),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff646464),
                              size: 18,
                            ),
                            Text(
                              'Toshkent, Uzbekistan',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff646464),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '57',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Posts',
                            style:
                                TextStyle(fontSize: 12, color: Color(0xff646464)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '400',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Follower',
                            style:
                                TextStyle(fontSize: 12, color: Color(0xff646464)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '981',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Following',
                            style:
                                TextStyle(fontSize: 12, color: Color(0xff646464)),
                          ),
          
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Post());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
