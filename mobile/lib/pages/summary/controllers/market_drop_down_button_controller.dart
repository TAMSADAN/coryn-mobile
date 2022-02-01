import 'package:get/get.dart';

class MarketDropDownButtonController extends GetxController {
  final List<String> marketList = ["전체", "KRW", "BTC"];
  String market = "KRW";

  void onchanged(value) {
    market = value as String;
    update();
  }
}
