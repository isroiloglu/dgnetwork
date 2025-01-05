import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 8,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1734523160404-8f500ff8b2e3?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 11),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ola Max',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '10 mins ago',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff646464),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/icons/ellipsis.png',
                  height: 24,
                  width: 24,
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          Image.network(
            'https://images.unsplash.com/photo-1735507582615-0321c88f6dbb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            height: 186,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/heart.png',
                    height: 20,
                    width: 20,
                  ),
                  Text('90'),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/comment.png',
                    height: 20,
                    width: 20,
                  ),
                  Text('3'),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/share.png',
                    height: 20,
                    width: 20,
                  ),
                  Text('10'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
