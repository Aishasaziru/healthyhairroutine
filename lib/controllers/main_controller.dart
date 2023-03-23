import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  var hairTips = <String, dynamic>{}.obs;
  var products = <String, dynamic>{}.obs;

  @override
  onReady() {
    hairTips.bindStream(hairTipsStream());
    products.bindStream(productStream());
    super.onReady();
  }

  Stream<Map<String, dynamic>> hairTipsStream() {
    var ref = FirebaseFirestore.instance.collection('hairtips').snapshots();
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }

  Stream<Map<String, dynamic>> productStream() {
    var ref = FirebaseFirestore.instance.collection('products').snapshots();
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }
}
