import 'package:dgnetwork/ui/screens/bottom_nav_bar_page.dart';
import 'package:dgnetwork/ui/screens/create_post_screen.dart';
import 'package:dgnetwork/ui/screens/home_screen.dart';
import 'package:dgnetwork/ui/screens/onboarding_screen.dart';
import 'package:dgnetwork/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavBarPage(),
    );
  }
}
