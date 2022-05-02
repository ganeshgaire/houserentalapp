import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:testapp/components/colorscomponent.dart';
import 'package:testapp/model/login_model.dart';
import 'package:testapp/view/mainpage.dart';
import 'package:testapp/view/signup.dart';
import 'package:http/http.dart' as http;

import '../model/progressgud.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final snackBar = const SnackBar(
    content: Text('Login Unsucessfull'),
  );
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  Future login() async {
    final prefs = await SharedPreferences.getInstance();
    String url =
        "https://ecommerce.nctbutwal.com/api/v2/ecommerce/customer/login";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["data"];
      final userData = jsonEncode(data);
      prefs.setBool('islogin', true);
      prefs.setString('userData', userData);

      setState(() {
        isApiCallProcess = false;
      });

      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return const MainPage();
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

  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
  }

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
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 290,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/house8.png'),
                  ),
                ),
              ),
              const Text(
                '\"House Rental System\"',
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
                'Find Your Dream House',
                style: TextStyle(
                  fontSize: 14,
                ),
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
                          onSaved: (input) => requestModel.email = input,
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
                          onSaved: (input) => requestModel.password = input,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'field can\'t be empty ';
                            }
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
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: ((context) {
                          return const SignUpScreen();
                        }),
                      ));
                    }),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return const MainPage();
                      }),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 135, 90, 214)),
                child: Text(
                  'Skip Now',
                ),
              )
            ],
          ),
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
