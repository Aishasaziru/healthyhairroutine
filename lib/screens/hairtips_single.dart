import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class HairTipsSingle extends StatelessWidget {
  const HairTipsSingle({super.key, required this.tip});
  final Map tip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Hair Routine Tip"),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image of product
              Container(
                width: Get.width,
                height: Get.height * .3,
                decoration: BoxDecoration(
                    image: (tip["image"] == null || tip["image"] == "")
                        ? DecorationImage(
                            image: AssetImage("images/logo.jpeg"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(tip["image"]),
                            fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text("${tip["title"] ?? "Tip"}"),
                    ),
                    // Text(
                    //   "${product["price"] ?? "0 KSH"}",
                    //   style: TextStyle(
                    //       color: Colors.orange, fontWeight: FontWeight.bold),
                    // )
                  ],
                ),
                subtitle: Text(
                    ("${tip["content"] ?? ""}").replaceAll(r"\n ", "\n\n")),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: Get.width * .6,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () async {
                        await MainController.to
                            .openUrl("${tip["video"] ?? ""}");
                      },
                      child: Text(
                        "View Video",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
