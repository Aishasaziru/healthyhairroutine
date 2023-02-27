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
              height: MediaQuery.of(context).size.height * 0.3,
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
                children: [
                  //FIRST CHILD
                  Column(
                    children: const [
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CALL",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),

                  //SECOND CHILD
                  Column(
                    children: const [
                      Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SHARE",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  //THIRD CHILD
                  Column(
                    children: const [
                      Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MESSAGE",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Hair care can often be challenging, especially if you are limited on time, but keeping your hair healthy and stylish can help you feel more confident and attractive. Creating a hair care routine is easy and involves maintaining the health of your hair and applying beneficial products to your hair. Luckily, your hair doesn't always need attention every day, and many things in a hair care routine can be done only once or twice a week.",
                ),
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
