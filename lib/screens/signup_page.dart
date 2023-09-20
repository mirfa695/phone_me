import 'package:flutter/material.dart';
import 'package:phone/custom_widgets/custom_text_field.dart';
import 'package:phone/screens/login_page.dart';
import 'package:phone/utilities/constants.dart';

import '../Services/firebase_serices.dart';
import 'offers_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final cPasswordTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/img_1.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: Constants.tstyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      text: 'email',
                      con: emailTextEditingController,
                      val: (val) {
                        if (val == null ||
                            !val.contains('@') ||
                            !val.endsWith('.com')) {
                          return 'please enter valid email';
                        }
                        return null;
                      },
                      choice: false,
                      icon: Icons.account_circle_outlined,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      text: 'password',
                      val: (value) {
                        if (value == null || value.length < 8) {
                          return 'Password must be greater than 8';
                        }
                        return null;
                      },
                      con: passwordTextEditingController,
                      choice: false,
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      text: 'confirm password',
                      val: (value2) {
                        if (value2 != passwordTextEditingController.text) {
                          return 'password must be same';
                        }
                        return null;
                      },
                      con: cPasswordTextEditingController,
                      choice: true,
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final auth = await FirebaseService()
                              .registerWithEmailAndPassword(
                              emailTextEditingController.text,
                              passwordTextEditingController.text);
                          if (auth != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OffersPage()));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.withOpacity(.5)),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Account Exists?   ",
                            style: TextStyle(color: Colors.grey)),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text('Login',
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 16)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
