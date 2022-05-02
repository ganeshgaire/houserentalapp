import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/signup_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final snackBar = const SnackBar(
    content: Text('Email Already Exist'),
  );
  final sucessmsg = const SnackBar(
    content: Text('sucessfully register'),
  );
  late SignupModel signupmodel;
  String? data;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signup() async {
    try {
      String url =
          "https://ecommerce.nctbutwal.com/api/v2/ecommerce/customer/register";
      final response =
          await http.post(Uri.parse(url), body: signupmodel.toJson());
      print(response.statusCode);
      if (response.statusCode == 200) {
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

  @override
  void initState() {
    super.initState();
    signupmodel = SignupModel();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/houseicon.png'),
                ),
              ),
            ),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (input) {
                          signupmodel.firstname = input;
                        },
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }

                          return null;
                        }),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'FirstName'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (input) => signupmodel.lastname = input,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }

                          return null;
                        }),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'LastName'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (input) => signupmodel.phonenumber = input,
                        keyboardType: TextInputType.number,
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
                            hintText: 'PhoneNumber'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (input) => signupmodel.password = input,
                        obscureText: true,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }

                          return null;
                        }),
                        decoration: InputDecoration(
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
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  signup();
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: ((context) {
                //       return const MainPage();
                //     }),
                //   ),
                // );
              },
              child: const Text(
                'Sign Up ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Or create account using Social media'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.facebook,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
