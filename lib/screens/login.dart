import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/utils.dart';
import '../controllers/auth_controller.dart';
import './login.dart';
import './signup.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                decoration: const InputDecoration(
                  labelText: 'Enter your Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Enter your Password',
                ),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Dont have an Account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Handle login button press

                  if (emailController.text.trim().isEmpty ||
                      !emailController.text.trim().isEmail) {
                    Utils.showError("Please Enter valid email!");
                  } else if (passwordController.text.trim().isEmpty) {
                    Utils.showError("No field should be empty!");
                  } else {
                    await AuthController.to.login(emailController.text.trim(),
                        passwordController.text.trim());
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  primary: Colors.pink, //Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), //Rounded coners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40, //Horizntal padding
                    vertical: 20, //Vertical padding
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
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
