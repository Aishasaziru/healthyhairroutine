import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  var hairTips = <String, dynamic>{}.obs;
  var products = <String, dynamic>{}.obs;
  var services = <String, dynamic>{}.obs;

  @override
  onReady() {
    hairTips.bindStream(hairTipsStream());
    products.bindStream(productStream());
    services.bindStream(servicesStream());
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

  Stream<Map<String, dynamic>> servicesStream() {
    var ref = FirebaseFirestore.instance.collection('services').snapshots();
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }

//Send buy request via whatsapp
  Future<void> sendBuyRequest(productName) async {
    //https://wa.me/whatsappphonenumber?text=urlencodedtext
    var _url = Uri(
      scheme: 'https',
      path: 'wa.me/0722590386',
      queryParameters: <String, String>{
        'text': Uri.encodeComponent(
            'Hello, I am interested in the product: $productName'),
      },
    );
    if (!await launchUrl(_url)) {
      print('Could not launch $_url');
    }
  }

//Send service request via whatsapp
  Future<void> sendServiceRequest(serviceName) async {
    //https://wa.me/whatsappphonenumber?text=urlencodedtext
    var _url = Uri(
      scheme: 'https',
      path: 'wa.me/0722590386',
      queryParameters: <String, String>{
        'text': Uri.encodeComponent(
            'Hello, I am interested in the service: $serviceName'),
      },
    );
    if (!await launchUrl(_url)) {
      print('Could not launch $_url');
    }
  }

  //Send service request via whatsapp
  Future<void> openUrl(videoUrl) async {
    //https://wa.me/whatsappphonenumber?text=urlencodedtext
    var _url = Uri.parse(videoUrl);
    if (!await launchUrl(_url)) {
      print('Could not launch $_url');
    }
  }
}
