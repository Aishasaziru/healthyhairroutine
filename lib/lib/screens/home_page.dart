import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/controllers/main_controller.dart';
import 'package:my_flutter_project/screens/info_init.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key});
  Widget _buildImageCard(BuildContext context, Map<String, dynamic> data) {
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
              child: Image.network(
                "${data["image"]}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${data["title"]}",
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
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              //IMAGE

              MainController.to.hairTips.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoImage()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(MainController
                                    .to.hairTips.entries.first.value["image"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
                                  children: [
                                    Text(
                                      "${MainController.to.hairTips.entries.first.value["title"]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
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
                children: MainController.to.hairTips.entries.skip(1).map((e) {
                  return _buildImageCard(context, e.value);
                }).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
