import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_search_bar_controller.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/models/coin.dart';

class CoinListController extends GetxController {
  final _searchCon = Get.find<CoinSearchBarController>();

  List<Coin> orignCoinList = [];
  List<Coin> coinList = [];

  int sortName = 0;
  int sortPrice = 0;
  int sortRate = 0;
  int sortKimp = 0;

  DateTime updateTime = DateTime.now();

  @override
  void onInit() {
    fetchCoinList();
    super.onInit();
  }

  void fetchCoinList() async {
    orignCoinList = await CoinService().fetchCoinList() ?? orignCoinList;
    coinList = [...orignCoinList];
    coinList = _remainKRW(coinList);
    updateTime = DateTime.now();
    sort();
    update();

    await Future.delayed(Duration(seconds: 1), () => fetchCoinList());
  }

  void updateSortType(String type) {
    if (type == "이름") {
      sortName++;
      sortPrice = 0;
      sortRate = 0;
      sortKimp = 0;
    } else if (type == "현재가") {
      sortName = 0;
      sortPrice++;
      sortRate = 0;
      sortKimp = 0;
    } else if (type == "전일대비") {
      sortName = 0;
      sortPrice = 0;
      sortRate++;
      sortKimp = 0;
    } else if (type == "김프") {
      sortName = 0;
      sortPrice = 0;
      sortRate = 0;
      sortKimp++;
    }
    update();
    sort();
  }

  void sort() {
    String _search = _searchCon.search;

    coinList = [...orignCoinList];
    coinList = _remainSearch(coinList, _search);
    coinList = _remainKRW(coinList);
    if (sortName != 0) {
      coinList = _sortByName(coinList);
    }
    if (sortPrice != 0) {
      coinList = _sortByPrice(coinList);
    }
    if (sortRate != 0) {
      coinList = _sortByRate(coinList);
    }
    if (sortKimp != 0) {
      coinList = _sortByKimp(coinList);
    }
    update();
  }

  List<Coin> _remainSearch(List<Coin> coinList, String search) {
    List<Coin> _coinList = [];

    for (var coin in coinList) {
      if (coin.koreanName.contains(search)) {
        _coinList.add(coin);
      } else if (coin.baseSymbol.contains(search.toUpperCase())) {
        _coinList.add(coin);
      }
    }
    return _coinList;
  }

  List<Coin> _sortByKimp(List<Coin> coinList) {
    coinList.sort((b, a) => a.kimpRate.compareTo(b.kimpRate));
    if (sortKimp % 2 == 0) {
      coinList = coinList.reversed.toList();
    }
    return coinList;
  }

  List<Coin> _sortByRate(List<Coin> coinList) {
    coinList.sort((b, a) => a.changeRate.compareTo(b.changeRate));
    if (sortRate % 2 == 0) {
      coinList = coinList.reversed.toList();
    }
    return coinList;
  }

  List<Coin> _sortByName(List<Coin> coinList) {
    coinList.sort((a, b) => a.koreanName.compareTo(b.koreanName));
    if (sortName % 2 == 0) {
      coinList = coinList.reversed.toList();
    }
    return coinList;
  }

  List<Coin> _sortByPrice(List<Coin> coinList) {
    coinList.sort((b, a) => a.upbitPrice.compareTo(b.upbitPrice));
    if (sortPrice % 2 == 0) {
      coinList = coinList.reversed.toList();
    }
    return coinList;
  }

  List<Coin> _remainKRW(List<Coin> coinList) {
    coinList.removeWhere((coin) => coin.quoteSymbol != 'KRW');
    return coinList;
  }
}
