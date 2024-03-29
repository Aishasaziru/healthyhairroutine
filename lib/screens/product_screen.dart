import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/controllers/main_controller.dart';

import 'product_single.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: MainController.to.products.entries.map((e) {
              return ProductCard(product: {
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

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Map product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductSingle(
              product: product,
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
                  image: (product["image"] == null || product["image"] == "")
                      ? DecorationImage(
                          image: AssetImage("images/logo.jpeg"),
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(product["image"]),
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
                        "${product["title"] ?? "Product"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${product["price"] ?? "0 KSH"}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
