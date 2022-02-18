import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mobile/service/coin_gecko_service.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/utils/secrets.dart';

class CoinListController extends SuperController {
  final _coinService = CoinService();
  Map<String, List<Coin>> coinData = {};
  List<Coin> coinList = [];

  String selectedPlatform = 'UPBIT';
  String selectedTarget = '';
  List<String> platformList = Secrets.platformEnglishNameList;
  List<String> targetList = [''];

  String search = "";

  int sortName = 0;
  int sortPrice = 0;
  int sortRate = 0;
  int sortKimp = 0;

  DateTime updatedTime = DateTime.now();
  bool stop = false;
  bool isFetching = false;
  bool isPaused = false;

  @override
  void onInit() {
    loopFetchCoinData();
    super.onInit();
  }

  Future<void> loopFetchCoinData() async {
    await fetchCoinData(selectedPlatform);
    await Future.delayed(const Duration(seconds: 3));
    if (isPaused == false) {
      await loopFetchCoinData();
    }
  }

  Future<void> fetchBinanceCoinData() async {
    coinData["BINANCE"] = (await _coinService.fetchCoinListFromBinance()) ??
        coinData["BINANCE"] ??
        [];
    update();
  }

  Future<void> fetchCoinData(String platform) async {
    if (isFetching == true) {
      return;
    }
    _updateIsFetching(true);
    await fetchBinanceCoinData();
    coinData[platform.toUpperCase()] = (await _coinService.fetchCoinList(
            platform.toUpperCase(), coinData["BINANCE"] ?? [])) ??
        coinData[platform.toUpperCase()] ??
        [];
    update();
    _updateCoinList(selectedPlatform);
    _updateUpdatedTime(DateTime.now());
    _updateTargetList();
    print("CoinListController fetchCoinData ${updatedTime}");
    _updateIsFetching(false);
    sort();
  }

  void _updateUpdatedTime(DateTime date) {
    updatedTime = date;
    update();
  }

  void _updateIsFetching(bool value) {
    isFetching = value;
    update();
  }

  void _updateIsPaused(bool value) {
    isPaused = value;
    update();
  }

  void _updateCoinList(String platform) {
    coinList = coinData[platform.toUpperCase()] ?? [];
    update();
  }

  void sort() {
    _updateCoinList(selectedPlatform);
    _updateCoinListByTarget(selectedTarget);
    _updateCoinListBySearch(search);
    update();
  }

  void _updateTargetList() {
    targetList = [];
    for (Coin _coin in coinList) {
      if (targetList.contains(_coin.target)) continue;
      targetList.add(_coin.target);
    }
    if (targetList.isNotEmpty && targetList.contains(selectedTarget) == false) {
      selectedTarget = targetList[0];
    }
    update();
  }

  void updateSearch(String value) {
    search = value;
    update();
    sort();
  }

  void updateSelectedPlatform(String value) {
    selectedPlatform = value;
    sort();
    update();
  }

  void updateselectedTarget(String value) {
    selectedTarget = value;
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

  void _updateCoinListBySearch(String search) {
    List<Coin> _coinList = [];
    for (Coin _coin in coinList) {
      if (_coin.koreanName != null && _coin.koreanName!.contains(search)) {
        _coinList.add(_coin);
      } else if (_coin.base.contains(search.toUpperCase())) {
        _coinList.add(_coin);
      }
    }
    coinList = _coinList;
    update();
  }

  List<Coin> _remainSearch(List<Coin> coinList, String search) {
    List<Coin> _coinList = [];

    for (var coin in coinList) {
      if (coin.koreanName != null && coin.koreanName!.contains(search)) {
        _coinList.add(coin);
      } else if (coin.base.contains(search.toUpperCase())) {
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

  void _updateCoinListByTarget(String target) {
    coinList.removeWhere((_coin) => _coin.target != target);
    update();
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
    _updateIsPaused(true);
    print("onPaused");
  }

  @override
  void onResumed() {
    _updateIsPaused(false);
    loopFetchCoinData();
    print("onResumed");
  }
}
