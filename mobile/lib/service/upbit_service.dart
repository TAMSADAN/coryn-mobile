import 'package:mobile/models/coin.dart';
import 'package:mobile/models/upbit_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpbitService {
  Future<List<UpbitCoin>?> fetchUpbitCoin() async {
    List<UpbitCoin> upbitCoinList = [];
    List<UpbitCoinMarket>? _upbitCoinMarketList =
        await _fetchUpbitCoinMarketList();
    if (_upbitCoinMarketList == null || _upbitCoinMarketList.isEmpty) {
      print(
          "UpbitService fetchUpbitCoin _upbitcoinMarketList is null or empty");
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
        return null;
      }
    }
    return upbitCoinList;
  }

  List<Coin>? parseCoinList(List<UpbitCoin> upbitCoinList) {
    List<Coin> coinList = [];
    try {
      for (var _upbitCoin in upbitCoinList) {
        Coin _coin = Coin(
          platform: "UPBIT",
          baseSymbol: _upbitCoin.marketData.market.split('-')[1],
          quoteSymbol: _upbitCoin.marketData.market.split('-')[0],
          koreanName: _upbitCoin.marketData.koreanName,
          englishName: _upbitCoin.marketData.englishName,
          tradePrice: _upbitCoin.priceData.tradePrice,
          changeRate: _upbitCoin.priceData.changeRate,
          changePrice: _upbitCoin.priceData.changePrice,
          volume: _upbitCoin.priceData.accTradePrice24h,
        );
        coinList.add(_coin);
      }
      return coinList;
    } catch (e) {
      print("UpbitService parseToCoinList parse error");
      return null;
    }
  }

  Future<List<UpbitCoinMarket>?> _fetchUpbitCoinMarketList() async {
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
        return null;
      }
    }
    return upbitCoinMarketList;
  }
}
