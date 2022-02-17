import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/trading_view_service.dart';

class DetailController extends GetxController {
  final Coin coin;
  final _newsService = NewsService();
  final _tradingViewService = TradingViewService();

  List<News> normalNewsList = [];
  List<News> goodNewsList = [];

  bool isOkNews = false;
  bool? isOkTradingView;

  @override
  void onInit() {
    updateIsOkTradingView();

    fetchNewsList();
    super.onInit();
  }

  Future<String?> fetchTradingViewUri() async {
    String? html = await _tradingViewService.fetchTradingViewHTML(
        coin.base, coin.target, coin.platform);
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

  void fetchNewsList() async {
    _updateIsOkNews(false);
    List<News> _newsList =
        await _newsService.fetchMarketNews(coin.target + "-" + coin.base);
    for (var _news in _newsList) {
      if (_news.newsType == "good") goodNewsList.add(_news);
      if (_news.newsType == "normal") normalNewsList.add(_news);
    }
    _updateIsOkNews(true);
    update();
  }

  Future<void> updateIsOkTradingView() async {
    isOkTradingView = await _tradingViewService.isOkTradingView(
        coin.base, coin.target, coin.platform);
    update();
  }

  void _updateIsOkNews(bool value) {
    isOkNews = value;
    update();
  }

  DetailController({required this.coin});
}
