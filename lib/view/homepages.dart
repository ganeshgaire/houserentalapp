import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/housepages/housepage1.dart';
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
  String? email;
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
            "http://192.168.1.34/houserentapi/housedetail/fetchhousedetail.php"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      //print(response.body);
      final data = jsonDecode(response.body);
      //print(data);
      for (var u in data) {
        detail.add(HouseModel.fromJson(u));
      }
      if (mounted) {
        setState(() {
          isloading = false;
          myhouse = detail;
        });
      }

      return 'sucess';
    } catch (e) {
      print(e);
    }
  }

  userdataread() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('userData');
    if (userData!.isNotEmpty) {
      final data = jsonDecode(userData.toString());
      setState(() {
        firstname = data['first_name'];
        lastname = data['last_name'];
        phonenumber = data['phone_number'];
        email = data['email'];
      });
      print(phonenumber);
    }

    // print(data["first_name"]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatafromApi();
    userdataread();
  }

  @override
  Widget build(BuildContext context) {
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
                          email: email,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hello " + firstname.toString() + "!",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Find your sweet Home',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            !isloading
                ? ListView.builder(
                    // reverse: true,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: myhouse.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() {
                            print(phonenumber);
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => HousePage(
                                  id: myhouse[index].id,
                                  houseimage: myhouse[index].houseImage,
                                  housename: myhouse[index].houseName,
                                  location: myhouse[index].location,
                                  bedroomno: myhouse[index].bedroomNo,
                                  bathroomno: myhouse[index].bathroomNo,
                                  price: myhouse[index].price,
                                  customernumber: phonenumber,
                                  customername: firstname,
                                  description: myhouse[index].description,
                                ),
                              ),
                            );
                          }),
                          child: Card(
                            color: const Color.fromARGB(255, 247, 239, 239),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 140,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            myhouse[index]
                                                .houseImage
                                                .toString(),
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(Icons.home);
                                            },
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        myhouse[index].houseName.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Address : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            myhouse[index].location.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Owner No.: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(myhouse[index]
                                              .phonenumber
                                              .toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Bedroom No : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(myhouse[index]
                                              .bedroomNo
                                              .toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Bathroom No : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(myhouse[index]
                                              .bathroomNo
                                              .toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Price : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Rs." +
                                                myhouse[index].price.toString(),
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
