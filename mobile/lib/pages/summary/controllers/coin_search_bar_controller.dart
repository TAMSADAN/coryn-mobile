import 'package:get/get.dart';
import 'coin_list_controller.dart';

class CoinSearchBarController extends GetxController {
  String search = "";

  void onChanged(value) {
    final _coinListController = Get.find<CoinListController>();

    search = value as String;
    _coinListController.sort();
    update();
  }
}
