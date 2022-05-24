import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/housemodel.dart';
import 'package:http/http.dart' as http;

class DeleteHouse extends StatefulWidget {
  const DeleteHouse({Key? key}) : super(key: key);

  @override
  State<DeleteHouse> createState() => _DeleteHouseState();
}

class _DeleteHouseState extends State<DeleteHouse> {
  bool isloading = false;
  String? houseid;
  List<HouseModel> detail = [];
  List<HouseModel> myhouse = [];
  final closefailed = const SnackBar(
    content: Text('Delete House Failed'),
  );
  final closesucess = const SnackBar(
    content: Text(' House Deleted Sucessfully'),
  );
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
      // print(data);
      for (var u in data) {
        detail.add(HouseModel.fromJson(u));
      }
      if (mounted) {
        setState(() {
          isloading = false;
          myhouse = detail;
        });
      }
      print(myhouse[0].houseName);
      return 'sucess';
    } catch (e) {
      print(e);
    }
  }

  Future deleteHouse() async {
    try {
      String url =
          "http://192.168.1.34/houserentapi/housedetail/deletehouserecord.php";
      var body = {
        "id": houseid,
      };
      var headers = {
        'content-type': 'application/json',
      };

      print(houseid);

      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(closesucess);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(closefailed);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatafromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Delete House Section"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                                      height: 160,
                                      width: 140,
                                      child: Image.network(
                                        myhouse[index].houseImage.toString(),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.home);
                                        },
                                        fit: BoxFit.cover,
                                      ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: const TextStyle(fontSize: 12),
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
                                          "Bathroom No :",
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
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 120),
                                        child: IconButton(
                                          onPressed: () {
                                            houseid =
                                                myhouse[index].id.toString();
                                            deleteHouse();
                                          },
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
