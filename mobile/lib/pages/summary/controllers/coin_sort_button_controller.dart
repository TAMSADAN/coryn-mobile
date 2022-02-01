import 'package:get/get.dart';

class CoinSortButtonController extends GetxController {
  final List<String> coinSortList = ["거래량", "등락률", "현재가"];
  String sort = "거래량";

  void onchanged(value) {
    sort = value as String;
    update();
  }
}
