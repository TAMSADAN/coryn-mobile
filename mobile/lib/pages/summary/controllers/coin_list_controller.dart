import 'package:get/get.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/pages/summary/controllers/coin_sort_button_controller.dart';
import 'package:mobile/pages/summary/controllers/market_drop_down_button_controller.dart';
import 'package:mobile/pages/summary/controllers/platform_drop_down_button_controller.dart';
import 'package:mobile/service/coin_service.dart';

class CoinListController extends GetxController {
  final _sortCon = Get.find<CoinSortButtonController>();
  final _marketCon = Get.find<MarketDropDownButtonController>();
  final _platformCon = Get.find<PlatformDropDownButtonController>();
  List<Coin> orignCoinList = [];
  List<Coin> coinList = [];

  @override
  void onInit() {
    fetchCoinList();
    super.onInit();
  }

  void sort() {
    String _sort = _sortCon.sort;
    String _market = _marketCon.market;
    String _platform = _platformCon.platform;

    coinList = [...orignCoinList];
    if (_sort == "거래량") {
      sortByTradeVolume();
    } else if (_sort == "등락률") {
      sortBychangeRate();
    } else if (_sort == "현재가") {
      sortByTradePrice();
    }
    if (_market == "KRW") {
      remainKRW();
    } else if (_market == "BTC") {
      remainBTC();
    }
  }

  void sortByTradeVolume() {
    coinList.sort((a, b) => a.price.tradeVolume.compareTo(b.price.tradeVolume));
    update();
  }

  void sortBychangeRate() {
    coinList.sort((b, a) => a.price.changeRate.compareTo(b.price.changeRate));
    update();
  }

  void sortByTradePrice() {
    coinList.sort((b, a) => a.price.tradePrice.compareTo(b.price.tradePrice));
    update();
  }

  void remainKRW() {
    coinList.removeWhere((coin) => !coin.market.contains("KRW"));
    update();
  }

  void remainBTC() {
    coinList.removeWhere(
        (coin) => !coin.market.contains("BTC") || coin.market.contains("KRW"));
    update();
  }

  void remainAll() {
    update();
  }

  void fetchCoinList() async {
    orignCoinList = await CoinService().fetchCoinList();
    coinList = [...orignCoinList];
    remainKRW();
    sortByTradeVolume();
    update();
  }
}
