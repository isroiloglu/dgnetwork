import 'dart:developer';

import 'package:dgnetwork/ui/screens/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController controllerPhone = TextEditingController();

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
                    'Create account or log in',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 64),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefix: Text('+998 ')),
                  controller: controllerPhone,
                ),
                const SizedBox(height: 64),
                GestureDetector(
                  onTap: () {
                    log('PHONE IS ${controllerPhone.text}');

                    auth.verifyPhoneNumber(
                        phoneNumber: '+998' + controllerPhone.text,
                        verificationCompleted:
                            (PhoneAuthCredential credetials) {},
                        verificationFailed: (e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  VerificationScreen(
                                id: verificationId,
                                phone: '+998${controllerPhone.text}',
                              ),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {});
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
                        Icon(Icons.message),
                        SizedBox(width: 8),
                        Text('Send OTP Code')
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
