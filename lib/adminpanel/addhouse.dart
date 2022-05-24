import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddHousePage extends StatefulWidget {
  const AddHousePage({Key? key}) : super(key: key);

  @override
  State<AddHousePage> createState() => _AddHousePageState();
}

class _AddHousePageState extends State<AddHousePage> {
  String? image64;
  String? housename;
  String? location;
  String? phonenumber;
  String? bedroomno;
  String? bathroomno;
  String? price;
  String? description;
  File? imageFile;
  final snackBar = const SnackBar(
    content: Text('House Already Exist'),
  );
  final sucessmsg = const SnackBar(
    content: Text('sucessfully register'),
  );

  void pickimage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        Uint8List bytes = file.readAsBytesSync();
        image64 = base64Encode(bytes);
        print(image64);

        //print(imageFile);
      } else {}
    } catch (error) {
      //print(error);
    }
  }

  Future signup() async {
    try {
      var body = {
        "housename": housename,
        "image": image64,
        "location": location,
        "owner_no": phonenumber,
        "bedroom_no": bedroomno,
        "bathroom_no": bathroomno,
        "price": price,
        "description": description
      };
      String url =
          "http://192.168.1.34/houserentapi/housedetail/houseregister.php";
      final response = await http.post(Uri.parse(url), body: jsonEncode(body));
      final result = jsonDecode(response.body);
      print(result);
      if (result["status"] == 200) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(sucessmsg);
      }
      if (response.statusCode == 409) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (error) {
      print(error);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 80,
        ),
        child: Form(
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                const Icon(
                  Icons.home,
                  size: 40,
                ),
                const Text(
                  "Add New House",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onSaved: (input) {
                      housename = input;
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.home),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'House Name'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onSaved: (input) => location = input,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.map_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'House Location'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (input) => phonenumber = input,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Phone Number'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onSaved: (input) => bedroomno = input,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.bed),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Bedroom No'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onSaved: (input) => bathroomno = input,
                    obscureText: true,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.bathroom),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Bathroom No'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onSaved: (input) => price = input,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.money),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Price'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (() {
                    pickimage();
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 158, 149, 149)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.image,
                            color: Color.fromARGB(255, 158, 149, 149),
                          ),
                          Text("Upload Image")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onSaved: (input) => description = input,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'field can\'t be empty ';
                      }

                      return null;
                    }),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Description'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        signup();
                      }
                    },
                    child: const Text("Submit"))
              ],
            )),
      ),
    ));
  }
}
