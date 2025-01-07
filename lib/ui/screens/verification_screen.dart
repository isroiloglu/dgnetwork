import 'dart:developer';

import 'package:dgnetwork/ui/screens/bottom_nav_bar_page.dart';
import 'package:dgnetwork/ui/screens/create_user_screen.dart';
import 'package:dgnetwork/ui/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.id, required this.phone});

  final String id;
  final String phone;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController controllerCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffDBEAFF),
        Color(0xffddceff),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xffE4D2FB),
                      Color(0xffF8DFF0),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Text(
                    'Input OTP Code\n******',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 64),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerCode,
                ),
                const SizedBox(height: 64),
                GestureDetector(
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.id,
                              smsCode: controllerCode.text);

                      await auth.signInWithCredential(credential);

                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) => CreateUserScreen(
                              phone: widget.phone,
                            ),
                          ),
                          (Route<dynamic> route) => false);
                    } catch (err) {
                      log('message $err');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8DFF0),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Verify number',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
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
