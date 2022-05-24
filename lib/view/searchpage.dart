import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../housepages/housepage1.dart';
import '../model/housemodel.dart';

class OwnSearchPage extends StatefulWidget {
  const OwnSearchPage({Key? key}) : super(key: key);

  @override
  State<OwnSearchPage> createState() => _OwnSearchPageState();
}

class _OwnSearchPageState extends State<OwnSearchPage> {
  String? searchhouse;
  bool isloading = false;
  List<HouseModel> detail = [];
  List<HouseModel> myhouse = [];
  final snackBar = const SnackBar(
    content: Text('Ticket Not Found'),
  );
  Future searchHouse() async {
    try {
      setState(() {
        isloading = true;
      });
      String url =
          "http://192.168.1.34/houserentapi/housedetail/searchhouse.php";
      var body = {
        "search": searchhouse,
      };
      var headers = {
        'content-type': 'application/json',
      };
      print(searchhouse);
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
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
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(179, 214, 208, 208),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.search),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextField(
                          onChanged: ((value) {
                            searchhouse = value;
                            searchHouse();
                          }),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search houses near you'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                                print(myhouse[index].houseImage);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        HousePage(
                                      id: myhouse[index].id,
                                      houseimage: myhouse[index].houseImage,
                                      housename: myhouse[index].houseName,
                                      location: myhouse[index].location,
                                      bedroomno: myhouse[index].bedroomNo,
                                      bathroomno: myhouse[index].bathroomNo,
                                      price: myhouse[index].price,
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
                                            width: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                myhouse[index]
                                                    .houseImage
                                                    .toString(),
                                                errorBuilder: (context, error,
                                                    stackTrace) {
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                myhouse[index]
                                                    .location
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Bedroom No :",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                "Bathroom No :",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Rs." +
                                                    myhouse[index]
                                                        .price
                                                        .toString(),
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
        ),
      ),
    );
  }
}
