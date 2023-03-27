import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/controllers/main_controller.dart';
import 'package:my_flutter_project/screens/hairtips_single.dart';
import 'package:my_flutter_project/screens/product_screen.dart';
import 'package:my_flutter_project/screens/services_screen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key});
  Widget _buildImageCard(BuildContext context, Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        Get.to(() => HairTipsSingle(tip: data));
      },
      child: Container(
        height: 300,
        width: Get.width * .45,
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: data["image"] == null || data["image"] == ""
                    ? Image.asset(
                        "images/logo.jpeg",
                        fit: BoxFit.cover,
                      )
                    : Image.network(
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
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          // )
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Products"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Services"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Get.to(() => const ProductScreen());
            }
            if (value == 1) {
              Get.to(() => const ServiceScreen());
            }
          }),
        ],
      ),
      //MAIN CONTENT
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //IMAGE

                MainController.to.hairTips.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => HairTipsSingle(
                                tip: MainController
                                    .to.hairTips.entries.first.value,
                              ));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 200,
                              width: Get.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(MainController.to.hairTips
                                      .entries.first.value["image"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //TITTLE,SUBTITLE SECTION
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [],
                //   ),
                // ),
                // const Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 20),
                //   ),
                // ),

                //SPACE
                // const SizedBox(
                //   height: 20,
                // ),
                //IMAGES GRIDVIEW
                SizedBox(
                  width: Get.width,
                  child: Wrap(
                    // crossAxisCount: 2,
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.spaceBetween,

                    // runSpacing: Get.width * 0.1,
                    children:
                        MainController.to.hairTips.entries.skip(1).map((e) {
                      return _buildImageCard(context, e.value);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
