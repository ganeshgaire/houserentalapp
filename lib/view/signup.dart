import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? get email => null;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
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
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }

                          return null;
                        }),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'FullName'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }
                          if (!RegExp(
                                  r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
                              .hasMatch(value)) {
                            return 'Password requirement doesn\'t match';
                          }

                          return null;
                        }),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Phone Number'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Phone Number Not Valid';
                          }
                          return null;
                        }),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
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
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }
                          if (!RegExp(
                                  r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                              .hasMatch(value)) {
                            return 'Password requirement doesn\'t match';
                          }
                          return null;
                        }),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
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
                if (formKey.currentState!.validate()) {}
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
            Text('Or create account using Social media'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: Colors.blue,
                  size: 30,
                ),
                const SizedBox(
                  width: 12,
                ),
                FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
                const SizedBox(
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
