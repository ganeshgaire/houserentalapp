import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:testapp/view/loginpage.dart';
import 'package:testapp/view/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Checkpage(),
    );
  }
}

class Checkpage extends StatefulWidget {
  const Checkpage({Key? key}) : super(key: key);

  @override
  State<Checkpage> createState() => _CheckpageState();
}

class _CheckpageState extends State<Checkpage> {
  bool ischeck = false;
  void fetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool islogin = prefs.getBool('islogin') ?? false;
    setState(() {
      ischeck = islogin;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return ischeck ? const MainPage() : const LoginPage();
  }
}
