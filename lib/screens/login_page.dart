import 'package:flutter/material.dart';
import 'package:phone/custom_widgets/custom_text_field.dart';
import 'package:phone/screens/home_page.dart';
import 'package:phone/screens/offers_page.dart';
import 'package:phone/screens/signup_page.dart';
import 'package:phone/utilities/constants.dart';

import '../Services/firebase_serices.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/img.png'), fit: BoxFit.cover)),
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
                      'LOGIN',
                      style: Constants.tstyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      text: 'email',
                      val: (value){
                        if(value==null||!value.contains('@')||!value.endsWith('.com')){
                          return'Please enter a valid email';
                        }
                        return null;
                      },
                      con: emailTextEditingController,
                      choice: false,
                      icon: Icons.account_circle_outlined,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      text: 'password',
                      con: passwordTextEditingController,
                      val: (value){
                        if(value==null||value.length<8){
                          return'password must be more than 8';
                        }
                        return null;

                      },
                      choice: true,
                      icon: Icons.lock,
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forget password?',
                            style: TextStyle(color: Colors.purple))),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                           if (formKey.currentState!.validate()) {final auth = await FirebaseService().signInUsingEmailPassword(
                            emailTextEditingController.text,passwordTextEditingController.text);
                            if (auth != null) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OffersPage()));
                      }}},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.withOpacity(.5)),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't you have an account?  ",
                            style: TextStyle(color: Colors.grey)),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: const Text('Sign Up',
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
