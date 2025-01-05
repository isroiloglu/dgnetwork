import 'package:dgnetwork/ui/widgets/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning, Alexander!',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '@maria_looper',
                    style: TextStyle(
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
          itemCount: 4,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Post(),
                ));
          },
        ),

      ),
    );
  }
}
