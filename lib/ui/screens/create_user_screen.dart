import 'dart:developer';

import 'package:dgnetwork/core/const.dart';
import 'package:dgnetwork/ui/screens/bottom_nav_bar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hive_flutter/adapters.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key, required this.phone});

  final String phone;

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAdress = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerProfession = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.ref("users/").push();
  late Box _box;

  @override
  void initState() {
    _box = Hive.box('myBox');

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
          title: const Text('Ro`yxatdan o`tish'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person),
                      Text('Ismingiz va familiyangiz'),
                    ],
                  ),
                ),
                controller: controllerName,
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.at),
                      Text('  nikingiz'),
                    ],
                  ),
                ),
                controller: controllerUsername,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('  Manzilingiz'),
                    ],
                  ),
                ),
                controller: controllerAdress,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.work_outline_outlined),
                      Text('  Mutaxasissligingiz'),
                    ],
                  ),
                ),
                controller: controllerProfession,
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await ref.set({
                      "name": controllerName.text,
                      "phone": widget.phone,
                      "username": controllerUsername.text,
                      "professions": controllerProfession.text,
                      "address": controllerAdress.text
                    });

                    name = controllerName.text;
                    userName = controllerUsername.text;
                    address = controllerAdress.text;
                    phone = widget.phone;
                    profession = controllerProfession.text;


                    log('===SEND DATA IS $phone');

                    _box.put('phone', phone);
                    _box.put('username', userName);
                    _box.put('name', name);
                    _box.put('address', address);
                    _box.put('profession', profession);
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => BottomNavBarPage(),
                        ),
                        (Route<dynamic> route) => false);
                  } catch (err) {
                    log('ERROR $err');
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8DFF0),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.message),
                      SizedBox(width: 8),
                      Text('Ma`lumotlarni tasdiqlash')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
