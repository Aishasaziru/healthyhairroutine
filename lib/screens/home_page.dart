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
            //TITTLE,SUBTITLE SECTION
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Healthy Hair Routine",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "By Aisha",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 18,
                  ),
                  Text("32"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
