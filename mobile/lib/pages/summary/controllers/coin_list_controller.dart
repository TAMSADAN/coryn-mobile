import 'package:get/get.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/service/coin_service.dart';

class CoinListController extends GetxController {
  List<Coin> orignCoinList = [];
  List<Coin> coinList = [];

  @override
  void onInit() {
    fetchCoinList();
    super.onInit();
  }

  void sortBy(int by) {
    if (by == 0) {
      sortByTradeVolume();
    } else if (by == 1) {
      sortBychangeRate();
    } else if (by == 2) {
      sortByTradePrice();
    }
  }

  void remainMarket(String market) {
    if (market == "KRW") {
      remainKRW();
    } else if (market == "BTC") {
      remainBTC();
    } else {
      remainAll();
    }
  }

  void sortByTradeVolume() {
    orignCoinList
        .sort((a, b) => a.price.tradeVolume.compareTo(b.price.tradeVolume));
    coinList = [...orignCoinList];
    update();
  }

  void sortBychangeRate() {
    orignCoinList
        .sort((b, a) => a.price.changeRate.compareTo(b.price.changeRate));
    coinList = [...orignCoinList];
    update();
  }

  void sortByTradePrice() {
    orignCoinList
        .sort((b, a) => a.price.tradePrice.compareTo(b.price.tradePrice));
    coinList = [...orignCoinList];
    update();
  }

  void remainKRW() {
    coinList = [...orignCoinList];
    coinList.removeWhere((coin) => !coin.market.contains("KRW"));
    update();
  }

  void remainBTC() {
    coinList = [...orignCoinList];
    coinList.removeWhere((coin) => !coin.market.contains("BTC"));
    update();
  }

  void remainAll() {
    coinList = [...orignCoinList];
    update();
  }

  void fetchCoinList() async {
    orignCoinList = await CoinService().fetchCoinList();
    coinList = [...orignCoinList];
    update();
  }
}
