import 'package:flutter/material.dart';
import 'package:my_flutter_project/screens/home_page.dart';
import 'package:my_flutter_project/screens/signup.dart';

import 'login.dart';

// ignore: camel_case_types
class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //FIRST CONTAINER
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/logo.jpeg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 59, 155, 172).withOpacity(0.2),
                      BlendMode.color),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Text(
              "Your hair is your canvas",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // LOGIN BUTTON
            SizedBox(
              width: MediaQuery.of(context).size.width * .65,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // SIGN UP BUTTON
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpScreen()));
              },
              style: TextButton.styleFrom(
                primary: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
