import 'package:flutter/material.dart';
import 'package:my_flutter_project/screens/home_page.dart';
import 'package:my_flutter_project/screens/signup.dart';

import 'login.dart';

// ignore: camel_case_types
class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //FIRST CONTAINER
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage("images/pink.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 59, 155, 172)
                            .withOpacity(0.2),
                        BlendMode.color),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 15,
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
                      borderRadius: BorderRadius.circular(19),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              // SIGN UP BUTTON
              SizedBox(
                width: MediaQuery.of(context).size.width * .65,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
