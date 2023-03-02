import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 82, 135),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.jpeg",
              fit: BoxFit.cover,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter your Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter your Password',
              ),
              obscureText: true,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Dont have an Accout ?"),
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle login button press
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 76, 88, 201), //Background color
                onPrimary: Color.fromARGB(255, 158, 42, 123), //Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), //Rounded coners
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 40, //Horizntal padding
                  vertical: 20, //Vertical padding
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
