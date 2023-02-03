import 'dart:io';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: const Text("Healthy Hair Routine"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      //MAIN CONTENT
      body: Container(
        child: ListView(
          children: [
            //IMAGE
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/blondyhair.jpg"),
                      fit: BoxFit.cover)),
            ),
            //SPACE
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("home remedies for hair"),
              subtitle: Text("by aisha have add git hub rep"),
            ),
          ],
        ),
      ),
    );
  }
}
