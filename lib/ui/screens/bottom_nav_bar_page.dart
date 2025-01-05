import 'package:dgnetwork/ui/screens/create_post_screen.dart';
import 'package:dgnetwork/ui/screens/home_screen.dart';
import 'package:dgnetwork/ui/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  List<Widget> pages = [HomeScreen(), CreatePostScreen(), ProfileScreen()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffDBEAFF),
        Color(0xffddceff),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Scaffold(
        body: pages[index],
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          padding: const EdgeInsets.all(9),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xff3873E9),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreatePostScreen(),
                ),
              );
            },
            elevation: 6.0,
            child: const Icon(
              size: 30,
              color: Colors.white,
              CupertinoIcons.add,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22))),
          ),
          padding: EdgeInsets.zero,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Icon(
                    Icons.home,
                    color: index == 0 ? Color(0xff3873E9) : Color(0xff9DB2CE),
                  ),
                ),
                const Icon(
                  CupertinoIcons.calendar,
                  color: Color(0xff9DB2CE),
                ),
                const SizedBox(),
                const Icon(
                  CupertinoIcons.search,
                  color: Color(0xff9DB2CE),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Icon(
                    index == 2
                        ? CupertinoIcons.person_fill
                        : CupertinoIcons.person,
                    color: index == 2 ? Color(0xff3873E9) : Color(0xff9DB2CE),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
