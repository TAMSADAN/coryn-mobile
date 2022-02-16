import 'package:mobile/models/binance_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/models/coin.dart';

class BinanceService {
  Future<List<BinanceCoin>?> fetchBinanceCoin() async {
    List<BinanceCoin> binanceCoinList = [];
    List<BinanceCoinMarket>? _binanceCoinMarketList =
        await _fetchBinanceCoinMarketList();
    if (_binanceCoinMarketList == null || _binanceCoinMarketList.isEmpty) {
      print(
          "BinanceService fetchBinanceCoin _binanceCoinMarketList is null or empty");
      return null;
    }
    final response =
        await http.get(Uri.parse("https://api.binance.com/api/v3/ticker/24hr"));

    // print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      try {
        for (var _json in json.decode(utf8.decode(response.bodyBytes))) {
          BinanceCoinPrice _binanceCoinPrice = BinanceCoinPrice.fromJson(_json);
          BinanceCoinMarket _binanceCoinMarket = _binanceCoinMarketList
              .firstWhere((_item) => _item.symbol == _binanceCoinPrice.symbol);
          BinanceCoin _binanceCoin = BinanceCoin(
              marketData: _binanceCoinMarket, priceData: _binanceCoinPrice);

          binanceCoinList.add(_binanceCoin);
        }
      } catch (e) {
        print("BinanceService fetchBinanceCoin json parsing error");
        return null;
      }
    }
    return binanceCoinList;
  }

  List<Coin>? parseCoinList(List<BinanceCoin> binanceCoinList) {
    List<Coin> coinList = [];

    try {
      for (var _binanceCoin in binanceCoinList) {
        Coin _coin = Coin(
            platform: "BINANCE",
            baseSymbol: _binanceCoin.marketData.baseAsset,
            quoteSymbol: _binanceCoin.marketData.quoteAsset,
            koreanName: null,
            englishName: null,
            tradePrice: double.parse(_binanceCoin.priceData.openPrice),
            changeRate: double.parse(_binanceCoin.priceData.priceChangePercent),
            changePrice: double.parse(_binanceCoin.priceData.priceChange),
            volume: double.parse(_binanceCoin.priceData.volume));
        coinList.add(_coin);
      }
    } catch (e) {
      print("BinanceService parseCoinList parse error");
      return null;
    }
    return coinList;
  }

  Future<List<BinanceCoinMarket>?> _fetchBinanceCoinMarketList() async {
    List<BinanceCoinMarket> binanceCoinMarketList = [];

    final response = await http
        .get(Uri.parse("https://api.binance.com/api/v3/exchangeInfo"));
    try {
      if (response.statusCode == 200) {
        for (var _json
            in json.decode(utf8.decode(response.bodyBytes))['symbols']) {
          var _binanceCoinMarket = BinanceCoinMarket.fromJson(_json);

          binanceCoinMarketList.add(_binanceCoinMarket);
        }
      }
    } catch (e) {
      return null;
    }
    return binanceCoinMarketList;
  }
}
