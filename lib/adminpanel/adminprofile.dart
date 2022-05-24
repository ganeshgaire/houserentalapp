import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  String firstname = '';
  String lastname = '';
  String email = '';
  userdataread() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('userData');
    final data = jsonDecode(userData!);
    // print(data["first_name"]);

    setState(() {
      firstname = data['first_name'];
      lastname = data['last_name'];
      email = data['email'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    userdataread();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 70,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[2],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    firstname + " " + lastname,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[2],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    email,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome to the house rental management system ",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
