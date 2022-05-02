import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/view/loginpage.dart';

class ProfilePage extends StatefulWidget {
  String? firstname;
  String? lastname;
  String? phonenumber;
  ProfilePage({Key? key, this.firstname, this.lastname, this.phonenumber})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;

  void pickimage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        setState(() {
          imageFile = file;
        });
      } else {
        // print(pickedFile);
      }
    } catch (error) {
      //print(error);
    }
    Navigator.pop(context);
  }

  void pickimageFromCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        setState(() {
          imageFile = file;
        });
      } else {
        print(pickedFile);
      }
    } catch (error) {
      print(error);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: imageFile != null
                        ? CircleAvatar(
                            radius: 60.0,
                            backgroundImage: FileImage(imageFile!))
                        : const CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('assets/avatar.png'),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 5),
                    child: ElevatedButton.icon(
                        onPressed: (() {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 228, 221, 221)),
                                        onPressed: () {
                                          pickimage();
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.photo_album,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Pick Gallery',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 228, 221, 221)),
                                        onPressed: () {
                                          pickimageFromCamera();
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.camera_alt,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Pick Camera',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ));
                        }),
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit \nphoto')),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[2],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      widget.firstname.toString() +
                          " " +
                          widget.lastname.toString(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[2],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'ganeshgaire121@gmail.com',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[2],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      widget.phonenumber.toString(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[2],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Buddhabhumi-8,Kapilvastu',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                autofocus: true,
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.remove('islogin');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return const LoginPage();
                      }),
                    ),
                  );
                },
                child: const Text(
                  'Log Out ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
