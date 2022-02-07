import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/pages/summary/controllers/coin_search_bar_controller.dart';
import 'package:mobile/pages/summary/controllers/coin_sort_button_controller.dart';
import 'package:mobile/pages/summary/controllers/market_drop_down_button_controller.dart';
import 'package:mobile/pages/summary/controllers/platform_drop_down_button_controller.dart';

class SummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoinListController());
    Get.put(CoinSortButtonController());
    Get.put(MarketDropDownButtonController());
    Get.put(PlatformDropDownButtonController());
    Get.put(CoinSearchBarController());
  }
}
