import 'dart:io';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: const Text("Healthy Hair Routine"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
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
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/zee.jpeg"), fit: BoxFit.cover)),
            ),
            //SPACE
            const SizedBox(
              height: 20,
            ),
            //TITTLE,SUBTITLE SECTION
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 18,
                  ),
                  const Text("32"),
                ],
              ),
            ),
            //SPACE
            const SizedBox(
              height: 30,
            ),
            //ACTION SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),

            //SPACE
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
