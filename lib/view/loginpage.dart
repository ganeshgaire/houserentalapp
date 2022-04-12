import 'package:flutter/material.dart';
import 'package:testapp/components/colorscomponent.dart';
import 'package:testapp/view/mainpage.dart';
import 'package:testapp/view/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? get email => null;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'field can\'t be empty ';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Enter Correct Email';
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
                            filled: true,
                            fillColor: Color.fromARGB(
                              255,
                              212,
                              221,
                              227,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
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
    );
  }
}
