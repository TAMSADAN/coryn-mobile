import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/chart.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/service/price_service.dart';
import 'package:mobile/service/news_service.dart';

class DetailModel {
  final _coinService = CoinService();
  final _priceService = PriceService();
  final _newsService = NewsService();

  // Future<Coin> fetchCoin(String market) {
  //   return _coinService.fetchCoin(market);
  // }

  Future<List<Chart>> fetchChartList(String market) async {
    List<Price> _priceList;
    List<Chart> _chartList;

    _priceList = await _priceService.fetchPriceList(market);
    _chartList = List.generate(
        _priceList.length,
        (index) => Chart(
            date: index.toString(), price: _priceList[index].openingPrice));

    return _chartList;
  }

  Future<List<News>> fetchNewsList(String market) async {
    return _newsService.fetchMarketNews(market);
  }
}
