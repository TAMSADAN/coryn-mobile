import 'package:get/get.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/pages/summary/controllers/coin_search_bar_controller.dart';
import 'package:mobile/pages/summary/controllers/coin_sort_button_controller.dart';
import 'package:mobile/pages/summary/controllers/market_drop_down_button_controller.dart';
import 'package:mobile/pages/summary/controllers/platform_drop_down_button_controller.dart';
import 'package:mobile/service/coin_service.dart';

class CoinListController extends GetxController {
  final _sortCon = Get.find<CoinSortButtonController>();
  final _marketCon = Get.find<MarketDropDownButtonController>();
  final _platformCon = Get.find<PlatformDropDownButtonController>();
  final _searchCon = Get.find<CoinSearchBarController>();

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
    String _search = _searchCon.search;

    coinList = [...orignCoinList];
    if (_sort == "거래량") {
      coinList = _sortByTradeVolume(coinList);
    } else if (_sort == "등락률") {
      coinList = _sortBychangeRate(coinList);
    } else if (_sort == "현재가") {
      coinList = _sortByTradePrice(coinList);
    }
    if (_market == "KRW") {
      coinList = _remainKRW(coinList);
    } else if (_market == "BTC") {
      coinList = _remainBTC(coinList);
    }
    coinList = _remainSearch(coinList, _search);
    update();
  }

  List<Coin> _remainSearch(List<Coin> coinList, String search) {
    List<Coin> _coinList = [];

    for (var coin in coinList) {
      if (coin.englishName.toUpperCase().contains(search.toUpperCase())) {
        // print(coin.englishName.toUpperCase() + "  VS  " + search.toUpperCase());
        _coinList.add(coin);
      } else if (coin.koreanName.contains(search)) {
        // print(coin.koreanName + "  VS  " + search);
        _coinList.add(coin);
      } else if (coin.market.split("-")[1].contains(search.toUpperCase())) {
        // print(coin.market.split("-")[1] + " VS " + search.toUpperCase());
        _coinList.add(coin);
      }
    }
    // print(_coinList.length);
    return _coinList;
  }

  List<Coin> _sortByTradeVolume(List<Coin> coinList) {
    coinList.sort((a, b) => a.price.tradeVolume.compareTo(b.price.tradeVolume));
    return coinList;
  }

  List<Coin> _sortBychangeRate(List<Coin> coinList) {
    coinList.sort((b, a) => a.price.changeRate.compareTo(b.price.changeRate));
    return coinList;
  }

  List<Coin> _sortByTradePrice(List<Coin> coinList) {
    coinList.sort((b, a) => a.price.tradePrice.compareTo(b.price.tradePrice));
    return coinList;
  }

  List<Coin> _remainKRW(List<Coin> coinList) {
    coinList.removeWhere((coin) => !coin.market.contains("KRW"));
    return coinList;
  }

  List<Coin> _remainBTC(List<Coin> coinList) {
    coinList.removeWhere(
        (coin) => !coin.market.contains("BTC") || coin.market.contains("KRW"));
    return coinList;
  }

  void fetchCoinList() async {
    orignCoinList = await CoinService().fetchCoinList();
    coinList = [...orignCoinList];
    coinList = _remainKRW(coinList);
    coinList = _sortByTradeVolume(coinList);
    update();
  }
}
