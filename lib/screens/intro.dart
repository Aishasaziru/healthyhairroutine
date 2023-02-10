import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //FIRST CONTAINER
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.022,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/blondyhair.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
