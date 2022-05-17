import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testapp/model/housemodel.dart';

import 'package:testapp/view/profile.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  String? firstname;
  String? lastname;
  String? phonenumber;
  int selectedIndex = 0;
  bool isloading = false;
  List<HouseModel> detail = [];
  List<HouseModel> myhouse = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future getDatafromApi() async {
    try {
      setState(() {
        isloading = true;
      });

      var response = await http.get(
        Uri.parse(
            "http://192.168.1.171/houserentapi/housedetail/fetchhousedetail.php"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      //print(response.body);
      final data = jsonDecode(response.body);
      print(data);
      for (var u in data) {
        detail.add(HouseModel.fromJson(u));
      }
      if (mounted) {
        setState(() {
          isloading = false;
          myhouse = detail;
        });
      }
      // print(myhouse[0].houseName);
      return 'sucess';
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 2, right: 2),
          child: AppBar(
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.navigate_before_outlined,
                  size: 40,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            title: const Text('House Rental App'),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return ProfilePage(
                          firstname: firstname,
                          lastname: lastname,
                          phonenumber: phonenumber,
                        );
                      }),
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello " + firstname.toString() + "!",
              style: const TextStyle(fontSize: 15),
            ),
            const Text(
              'Find your sweet Home',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 231, 225, 225),
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search houses near you'),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  getDatafromApi();
                },
                icon: const Icon(Icons.email))
            // ListView.builder(itemBuilder: (BuildContext context, int index) {
            //   return const InkWell();
            // })
          ],
        ),
      ),
    );
  }
}
