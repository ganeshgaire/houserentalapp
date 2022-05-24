import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/adminpanel/adminhomepage.dart';

import 'package:testapp/components/colorscomponent.dart';

import 'package:http/http.dart' as http;

import '../model/progressgud.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  String? email;
  String? password;
  final snackBar = const SnackBar(
    content: Text('Login Unsucessfull'),
  );
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isApiCallProcess = false;

  Future login() async {
    var body = {
      "email": email,
      "password": password,
    };
    final prefs = await SharedPreferences.getInstance();
    String url = "http://192.168.1.34/houserentapi/admin/login.php";

    final response = await http.post(Uri.parse(url), body: jsonEncode(body));
    final result = jsonDecode(response.body);
    //print(result["status"]);

    if (result["status"] == 200) {
      final data = jsonDecode(response.body)["data"];
      final userdata = jsonEncode(data);
      prefs.setBool('islogin', true);
      prefs.setString('userData', userdata);
      print(data["first_name"]);

      setState(() {
        isApiCallProcess = false;
      });

      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return const AdminHomePage();
          }),
        ),
      );
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // static Future<void> pop({bool? animated}) async {
  //   await SystemChannels.platform
  //       .invokeMethod<void>('SystemNavigator.pop', animated);
  // }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      key: null,
      valueColor: null,
    );
  }

  Widget _uiSetup(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // fit: BoxFit.cover,
                  image: AssetImage('assets/adminlogo.png'),
                ),
              ),
            ),
            const Text(
              '"House Rental System"',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Admin Page',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (input) => email = input,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }

                          return null;
                        }),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: bottomcolor),
                                borderRadius: BorderRadius.circular(8)),
                            filled: true,
                            fillColor: bottomcolor,
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Email'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        obscureText: true,
                        onSaved: (input) => password = input,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }
                          return null;
                        }),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(
                              255,
                              212,
                              221,
                              227,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(
                                  255,
                                  212,
                                  221,
                                  227,
                                ))),
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Password'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            ElevatedButton(
              autofocus: true,
              style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent,
                  maximumSize: Size(width * 0.6, 40),
                  minimumSize: Size(width * 0.6, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                //if (formKey.currentState!.validate()) {}
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });
                  login();
                  // APIService apiService = APIService();
                  // apiService.login(requestModel).then((value) => {
                  //       print(value),
                  //       setState(() {
                  //         isApiCallProcess = false;
                  //       })
                  //     });
                }

                // print(requestModel.toJson());
              },
              child: const Text(
                'Log in ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Text(
                //   'Don\'t have an account?',
                //   style: TextStyle(),
                // ),
                SizedBox(
                  width: 8,
                ),
                // InkWell(
                //   onTap: (() {
                //     Navigator.push(context, MaterialPageRoute(
                //       builder: ((context) {
                //         return const AdminSignupPage();
                //       }),
                //     ));
                //   }),
                //   child: const Text(
                //     'Sign Up',
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
