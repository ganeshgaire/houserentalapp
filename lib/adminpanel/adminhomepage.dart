import 'package:flutter/material.dart';
import 'package:testapp/adminpanel/addhouse.dart';
import 'package:testapp/adminpanel/adminprofile.dart';
import 'package:testapp/adminpanel/bookedhouse.dart';
import 'package:testapp/adminpanel/deletehouse.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: const Icon(Icons.home),
        title: const Text("Welcome To Admin Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AdminProfile()));
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.person,
                            size: 80,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Admin Profile"),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AddHousePage()));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.home,
                            size: 80,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Add House"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const DeleteHouse()));
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.delete,
                            size: 80,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Delete House"),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.logout_rounded,
                            size: 80,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Log Out"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BookedPage(),
                    ));
              }),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.bookmark,
                        size: 80,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Booked House"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
