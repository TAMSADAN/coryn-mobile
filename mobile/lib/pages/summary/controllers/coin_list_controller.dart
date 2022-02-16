import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/utils/coryn_static.dart';

class CoinListController extends SuperController {
  List<Coin> orignCoinList = [];
  List<Coin> coinList = [];

  String selectedPlaform = '업비트';
  String selectedMarket = '';
  List<String> platformList = CorynStatic.platformKoreanNameList;
  List<String> marketList = [''];

  String search = "";

  int sortName = 0;
  int sortPrice = 0;
  int sortRate = 0;
  int sortKimp = 0;

  DateTime updateTime = DateTime.now();
  bool stop = false;
  bool isFetching = false;

  @override
  void onInit() {
    fetchCoinList();
    super.onInit();
  }

  void _updateIsFetching(bool value) {
    isFetching = value;
    update();
  }

  void fetchCoinList() async {
    _updateIsFetching(true);
    orignCoinList = await CoinService()
            .fetchCoinList(CorynStatic.platformList[selectedPlaform]!) ??
        orignCoinList;
    coinList = [...orignCoinList];
    _updateMarketList(orignCoinList);
    updateTime = DateTime.now();
    sort();
    update();
    print("CoinListController fetchCoinList ${updateTime}");
    _updateIsFetching(false);
    if (stop == false) {
      _updateIsFetching(true);
      await Future.delayed(Duration(seconds: 30), () => fetchCoinList());
    }
  }

  void _updateMarketList(List<Coin> coinList) {
    marketList = [];
    for (Coin _coin in coinList) {
      if (marketList.contains(_coin.quoteSymbol)) continue;
      marketList.add(_coin.quoteSymbol);
    }
    if (marketList.isNotEmpty && marketList.contains(selectedMarket) == false) {
      selectedMarket = marketList[0];
    }
    update();
  }

  void updateSearch(String value) {
    search = value;
    sort();
    update();
  }

  void updateSelectedPlatform(String value) {
    selectedPlaform = value;
    sort();
    update();
  }

  void updateSelectedMarket(String value) {
    selectedMarket = value;
    sort();
    update();
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
    coinList = [...orignCoinList];
    coinList = _remainSearch(coinList, search);
    coinList = _remainMarket(coinList);
    // if (sortName != 0) {
    //   coinList = _sortByName(coinList);
    // }
    // if (sortPrice != 0) {
    //   coinList = _sortByPrice(coinList);
    // }
    // if (sortRate != 0) {
    //   coinList = _sortByRate(coinList);
    // }
    // if (sortKimp != 0) {
    //   coinList = _sortByKimp(coinList);
    // }
    update();
  }

  List<Coin> _remainSearch(List<Coin> coinList, String search) {
    List<Coin> _coinList = [];

    for (var coin in coinList) {
      if (coin.koreanName != null && coin.koreanName!.contains(search)) {
        _coinList.add(coin);
      } else if (coin.baseSymbol.contains(search.toUpperCase())) {
        _coinList.add(coin);
      }
    }
    return _coinList;
  }

  // List<Coin> _sortByKimp(List<Coin> coinList) {
  //   coinList.sort((b, a) => a.kimpRate.compareTo(b.kimpRate));
  //   if (sortKimp % 2 == 0) {
  //     coinList = coinList.reversed.toList();
  //   }
  //   return coinList;
  // }

  // List<Coin> _sortByRate(List<Coin> coinList) {
  //   coinList.sort((b, a) => a.changeRate.compareTo(b.changeRate));
  //   if (sortRate % 2 == 0) {
  //     coinList = coinList.reversed.toList();
  //   }
  //   return coinList;
  // }

  // List<Coin> _sortByName(List<Coin> coinList) {
  //   coinList.sort((a, b) => a.koreanName.compareTo(b.koreanName));
  //   if (sortName % 2 == 0) {
  //     coinList = coinList.reversed.toList();
  //   }
  //   return coinList;
  // }

  // List<Coin> _sortByPrice(List<Coin> coinList) {
  //   coinList.sort((b, a) => a.upbitPrice.compareTo(b.upbitPrice));
  //   if (sortPrice % 2 == 0) {
  //     coinList = coinList.reversed.toList();
  //   }
  //   return coinList;
  // }

  List<Coin> _remainMarket(List<Coin> coinList) {
    coinList.removeWhere((coin) => coin.quoteSymbol != selectedMarket);
    return coinList;
  }

  @override
  void onDetached() {
    print("onDetached");
  }

  @override
  void onInactive() {
    print("onInactive");
  }

  @override
  void onPaused() {
    stop = true;
    update();
    print("onPaused");
    print(stop);
  }

  @override
  void onResumed() {
    stop = false;
    update();
    if (isFetching == false) {
      fetchCoinList();
    }
    print("onResumed");
  }
}
