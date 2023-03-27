import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/controllers/main_controller.dart';

class ServicesSingle extends StatelessWidget {
  const ServicesSingle({super.key, required this.service});
  final Map service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${service["title"]}"),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image of service
              Container(
                width: Get.width,
                height: Get.height * .3,
                decoration: BoxDecoration(
                    image: (service["image"] == null || service["image"] == "")
                        ? DecorationImage(
                            image: AssetImage("images/logo.jpeg"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(service["image"]),
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
                      child: Text("${service["title"] ?? "service"}"),
                    ),
                    Text(
                      "${service["price"] ?? "0 KSH"}",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                subtitle: Text("${service["description"] ?? ""}"),
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
                            .sendBuyRequest("${service["title"] ?? "service"}");
                      },
                      child: Text(
                        "Buy Now",
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
