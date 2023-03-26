import 'package:flutter/material.dart';
import 'package:my_flutter_project/screens/info_init.dart';

import '../lib/screens/info_init.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key});
  Widget _buildImageCard(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoImage()),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Healthy Hair Routine Tips"),
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
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            //IMAGE
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoImage()),
                );
              },
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/hairmask.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                        "HAIR MASK",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  )),
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
            //IMAGES GRIDVIEW
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildImageCard(
                    context, "images/zee.jpeg", "Taking Care of Curly Hair"),
                _buildImageCard(
                    context, "images/woman3c.jpg", "How To Take Care of 3c"),
                _buildImageCard(context, "images/3b.jpg", "Taking Care of 3b"),
                _buildImageCard(context, "images/4a.jpg", "Taking Cre of 4a"),
                _buildImageCard(
                    context, "images/joanne.jpg", "Taking Care of 4b"),
                _buildImageCard(
                    context, "images/kiki4c.webp", "Taking Care of 4c"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
