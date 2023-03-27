import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/controllers/main_controller.dart';

import 'services_single.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: MainController.to.services.entries.map((e) {
              return ServiceCard(service: {
                "image": "${e.value["image"]}",
                "title": "${e.value["title"]}",
                "price": "${e.value["price"]}"
              });
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});
  final Map service;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ServicesSingle(
              service: service,
            ));
      },
      child: Container(
        width: Get.width * .45 - 16,
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(bottom: 10),
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              //width: Get.width * .45,
              height: 200,
              decoration: BoxDecoration(
                  image: (service["image"] == null || service["image"] == "")
                      ? DecorationImage(
                          image: AssetImage("images/logo.jpeg"),
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(service["image"]),
                          fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "${service["title"] ?? "Service"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${service["price"] ?? "0 KSH"}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
