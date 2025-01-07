import 'package:dgnetwork/ui/screens/auth_screen.dart';
import 'package:dgnetwork/ui/screens/onboarding_screen.dart';
import 'package:dgnetwork/ui/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
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
      home: FutureBuilder(
          future: Hive.openBox('myBox'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const OnboardingScreen();
            }else{
              return const Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Loading...'),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          }),
    );
  }
}
