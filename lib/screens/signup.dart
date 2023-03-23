import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/utils.dart';
import '../controllers/auth_controller.dart';
import 'home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/common.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: confirmpasswordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      // Implement sign up logic here
                      if (emailController.text.trim().isEmpty ||
                          !emailController.text.trim().isEmail) {
                        Utils.showError("Please Enter valid email!");
                      } else if (passwordController.text.trim().isEmpty) {
                        Utils.showError("No field should be empty!");
                      } else if (passwordController.text.trim() !=
                          confirmpasswordcontroller.text.trim()) {
                        Utils.showError("Password missmatch!");
                      } else {
                        await AuthController.to.register(namecontroller.text,
                            emailController.text, passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, //Background color
                      onPrimary: Colors.white, //Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), //Rounded coners
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40, //Horizntal padding
                        vertical: 20, //Vertical padding
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
