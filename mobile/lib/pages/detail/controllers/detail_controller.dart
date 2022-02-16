import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/models/chart.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/models/detail_model.dart';
import 'package:mobile/service/trading_view_service.dart';

class DetailController extends GetxController {
  final Coin coin;

  final _coinService = CoinService();
  final _newsService = NewsService();
  final _detailService = DetailModel();
  final _tradingViewService = TradingViewService();

  List<News> normalNewsList = [];
  List<News> goodNewsList = [];
  List<Chart> chartList = [];
  int isLoading = 3;
  bool fetchingCoin = true;
  bool fetchingNews = true;
  bool fetchingChart = true;
  bool? isOkTradingView;

  @override
  void onInit() {
    updateIsOkTradingView();
    super.onInit();
  }

  Future<void> updateIsOkTradingView() async {
    isOkTradingView = await _tradingViewService.isOkTradingView(
        coin.baseSymbol, coin.quoteSymbol, coin.platform);
    update();
  }

  Future<String?> fetchTradingViewUri() async {
    String? html = await _tradingViewService.fetchTradingViewHTML(
        coin.baseSymbol, coin.quoteSymbol, coin.platform);
    if (html == null) {
      print("DetailController fetchTradingViewUri: html is null");
      return null;
    }
    String uri;
    try {
      uri = Uri.dataFromString(
        html,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString();
    } catch (e) {
      print("DetailController fetchTradingViewUri: uri parse error");
      return null;
    }
    return uri;
  }

  void fetchCoin(String market) async {
    _updateFetchingCoin(true);
    // coin = await _coinService.fetchCoin(market);
    update();
    _updateFetchingCoin(false);
  }

  void fetchNewsList(String market) async {
    List<News> _newsList;

    _updateFetchingNews(true);
    goodNewsList.clear();
    normalNewsList.clear();
    _newsList = await _newsService.fetchMarketNews(market);
    for (var _news in _newsList) {
      if (_news.newsType == "good") goodNewsList.add(_news);
      if (_news.newsType == "normal") normalNewsList.add(_news);
    }
    update();
    _updateFetchingNews(false);
  }

  void fetchChartList(market) async {
    _updateFetchingChart(true);
    chartList.clear();
    chartList = await _detailService.fetchChartList(market);
    update();
    _updateFetchingChart(false);
  }

  void _updateFetchingCoin(bool currentStatus) {
    fetchingCoin = currentStatus;
    update();
  }

  void _updateFetchingNews(bool currentStatus) {
    fetchingNews = currentStatus;
    update();
  }

  void _updateFetchingChart(bool currentStatus) {
    fetchingChart = currentStatus;
    update();
  }

  List<Chart> normalizeChartList(List<Chart> chartList) {
    List<Chart> _normalizedChartList = [];
    List<double> _priceList;
    double _normalizedPrice;
    double _maxPrice;
    double _minPrice;

    _priceList =
        List.generate(chartList.length, (index) => chartList[index].price);
    _priceList.sort();
    _minPrice = _priceList.first;
    _maxPrice = _priceList.last;

    for (var chart in chartList) {
      _normalizedPrice = (chart.price - _minPrice) / (_maxPrice - _minPrice);
      _normalizedPrice = _normalizedPrice * 100 + 10;
      _normalizedChartList
          .add(Chart(date: chart.date, price: _normalizedPrice));
    }

    return _normalizedChartList;
  }

  DetailController({required this.coin});
}
