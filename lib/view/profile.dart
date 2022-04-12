import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                            // ignore: unnecessary_null_comparison
                            backgroundImage: FileImage(imageFile!)

                            //child: Image(
                            // image: AssetImage('assets/avatar.png'),
                            )
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
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Ganesh Gaire',
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
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      '9866133280',
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Follow ',
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
