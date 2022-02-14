import 'package:mobile/models/upbit_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpbitService {
  Future<List<UpbitCoin>?> fetchUpbitCoin(
      List<UpbitCoinMarket>? upbitCoinMarketList) async {
    List<UpbitCoin> upbitCoinList = [];
    List<UpbitCoinMarket> _upbitCoinMarketList =
        upbitCoinMarketList ?? await fetchUpbitCoinMarketList();
    if (_upbitCoinMarketList.isEmpty) {
      print("UpbitService fetchUpbitCoin _upbitcoinMarketList is empty");
      return null;
    }
    String _markets = _upbitCoinMarketList.map((e) => e.market).join(',');

    final response = await http
        .get(Uri.parse("https://api.upbit.com/v1/ticker?markets=$_markets"));

    if (response.statusCode == 200) {
      try {
        for (var _ in json.decode(utf8.decode(response.bodyBytes))) {
          var _upbitCoinPrice = UpbitCoinPrice.fromJson(_);
          var _upbitCoinMarket = _upbitCoinMarketList
              .firstWhere((_) => _.market == _upbitCoinPrice.market);

          upbitCoinList.add(UpbitCoin(
              marketData: _upbitCoinMarket, priceData: _upbitCoinPrice));
        }
      } catch (e) {
        print("UpbitService fetchUpbitCoin json parsing error");
      }
    }
    return upbitCoinList;
  }

  Future<List<UpbitCoinMarket>> fetchUpbitCoinMarketList() async {
    List<UpbitCoinMarket> upbitCoinMarketList = [];
    final response =
        await http.get(Uri.parse("https://api.upbit.com/v1/market/all"));
    if (response.statusCode == 200) {
      try {
        for (var _ in json.decode(utf8.decode(response.bodyBytes))) {
          var upbitCoinMarket = UpbitCoinMarket.fromJson(_);
          upbitCoinMarketList.add(upbitCoinMarket);
        }
      } catch (e) {
        print("UpbitService fetchUpbitCoinMarketList json parsing error");
      }
    }
    return upbitCoinMarketList;
  }
}
