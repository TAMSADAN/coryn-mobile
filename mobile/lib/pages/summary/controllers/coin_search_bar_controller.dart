import 'package:get/get.dart';

class CoinSearchBarController extends GetxController {
  String search = "";

  void onChanged(value) {
    search = value as String;
    update();
  }
}
