import 'package:mobile/models/binance_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BinanceService {
  Future<List<BinanceCoin>> fetchBinanceCoin(
      List<BinanceCoinMarket>? binanceCoinMarketList) async {
    List<BinanceCoin> binanceCoinList = [];
    List<BinanceCoinMarket> _binanceCoinMarketList =
        binanceCoinMarketList ?? await fetchBinanceCoinMarketList();

    final response = await http
        .get(Uri.parse("https://api.binance.com/api/v3/ticker/price"));

    if (response.statusCode == 200) {
      for (var _json in json.decode(utf8.decode(response.bodyBytes))) {
        var _binanceCoinPrice = BinanceCoinPrice.fromJson(_json);
        // print(_binanceCoinPrice.symbol +
        //     ':' +
        //     _binanceCoinPrice.price.toString());
        var _binanceCoinMarket = _binanceCoinMarketList
            .firstWhere((_item) => _item.symbol == _binanceCoinPrice.symbol);

        var _binanceCoin = BinanceCoin(
            marketData: _binanceCoinMarket, priceData: _binanceCoinPrice);
        binanceCoinList.add(_binanceCoin);
      }
    }
    return binanceCoinList;
  }

  Future<List<BinanceCoinMarket>> fetchBinanceCoinMarketList() async {
    List<BinanceCoinMarket> binanceCoinMarketList = [];

    final response = await http
        .get(Uri.parse("https://api.binance.com/api/v3/exchangeInfo"));

    if (response.statusCode == 200) {
      for (var _json
          in json.decode(utf8.decode(response.bodyBytes))['symbols']) {
        var _binanceCoinMarket = BinanceCoinMarket.fromJson(_json);

        binanceCoinMarketList.add(_binanceCoinMarket);
      }
    }

    return binanceCoinMarketList;
  }
}
