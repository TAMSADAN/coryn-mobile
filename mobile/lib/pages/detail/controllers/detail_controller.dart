import 'package:get/get.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/calendar_modal.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/coin_service.dart';

class DetailController extends GetxController {
  final _coinService = CoinService();
  final _newsService = NewsService();

  late Coin coin;
  List<News> normalNewsList = [];
  List<News> goodNewsList = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchInit(String market) {
    updateCoin(market);
    updateNewsList(market);
  }

  void updateCoin(String market) async {
    _updateIsLoading(true);
    coin = await _coinService.fetchCoin(market);
    update();
    _updateIsLoading(false);
  }

  void updateNewsList(String market) async {
    List<News> _newsList;

    _updateIsLoading(true);
    goodNewsList.clear();
    normalNewsList.clear();
    _newsList = await _newsService.fetchMarketNews(market);
    for (var _news in _newsList) {
      if (_news.newsType == "good") goodNewsList.add(_news);
      if (_news.newsType == "normal") normalNewsList.add(_news);
    }
    update();
    _updateIsLoading(false);
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
}
