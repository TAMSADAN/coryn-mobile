import 'package:get/get.dart';
import 'package:mobile/models/chart.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/models/detail_model.dart';

class DetailController extends GetxController {
  String market;

  final _coinService = CoinService();
  final _newsService = NewsService();
  final _detailService = DetailModel();

  late Coin coin;
  List<News> normalNewsList = [];
  List<News> goodNewsList = [];
  List<Chart> chartList = [];
  int isLoading = 3;

  @override
  void onInit() {
    super.onInit();
    fetchCoin(market);
    fetchNewsList(market);
    fetchChartList(market);
  }

  void fetchCoin(String market) async {
    coin = await _coinService.fetchCoin(market);
    update();
    _updateIsLoading();
  }

  void fetchNewsList(String market) async {
    List<News> _newsList;

    goodNewsList.clear();
    normalNewsList.clear();
    _newsList = await _newsService.fetchMarketNews(market);
    for (var _news in _newsList) {
      if (_news.newsType == "good") goodNewsList.add(_news);
      if (_news.newsType == "normal") normalNewsList.add(_news);
    }
    update();
    _updateIsLoading();
  }

  void fetchChartList(market) async {
    chartList.clear();
    chartList = await _detailService.fetchChartList(market);
    update();
    _updateIsLoading();
  }

  void _updateIsLoading() {
    isLoading--;
    update();
  }

  DetailController({required this.market});
}
