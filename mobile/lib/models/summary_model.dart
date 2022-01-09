import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/service/price_service.dart';
import 'package:mobile/service/news_service.dart';

class SummaryModel {
  final _coinService = CoinService();

  Future<List<Coin>> fetchKrwCoinList() async {
    List<Coin> _coinList;
    List<Coin> _krwCoinList = [];

    _coinList = await _coinService.fetchCoinList();
    for (int i = 0; i < _coinList.length; i++) {
      if (_coinList[i].market.contains("KRW")) _krwCoinList.add(_coinList[i]);
    }

    return _krwCoinList;
  }
}
