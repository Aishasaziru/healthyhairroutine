import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/controllers/main_controller.dart';

class ProductSingle extends StatelessWidget {
  const ProductSingle({super.key, required this.product});
  final Map product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product["title"]}"),
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
                    image: (product["image"] == null || product["image"] == "")
                        ? DecorationImage(
                            image: AssetImage("images/logo.jpeg"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(product["image"]),
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
                      child: Text("${product["title"] ?? "Product"}"),
                    ),
                    Text(
                      "${product["price"] ?? "0 KSH"}",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                subtitle: Text("${product["description"] ?? ""}"),
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
                            .sendBuyRequest("${product["title"] ?? "Product"}");
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
