import 'package:http/http.dart' as http;
import 'package:mobile/models/binance_coin.dart';
import 'dart:convert';

import 'package:mobile/models/coin.dart';
import 'package:mobile/models/upbit_coin.dart';
import 'package:mobile/service/binance_service.dart';
import 'package:mobile/service/upbit_service.dart';

class CoinService {
  // Future<Coin> fetchCoin(String market) async {
  //   Coin coin;
  //   final response =
  //       await http.get(Uri.http("13.125.161.94:8080", "/api/v1/coins/$market"));

  //   if (response.statusCode == 200) {
  //     coin = Coin.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  //     return coin;
  //   } else {
  //     return Future.error("fetch coin failed");
  //   }
  // }

  Future<List<Coin>> fetchCoinList() async {
    List<Coin> coinList = [];
    final List<UpbitCoin> _upbitCoinList =
        await UpbitService().fetchUpbitCoin(null);
    final List<BinanceCoin> _binanceCoinList =
        await BinanceService().fetchBinanceCoin(null);

    for (var _upbitCoin in _upbitCoinList) {}

    return coinList;
  }

  Future<List<Coin>> fetchCoinListFromUpbit() async {
    List<Coin> _coinList = [];
    final List<UpbitCoin> _upbitCoinList =
        await UpbitService().fetchUpbitCoin(null);

    for (var _upbitCoin in _upbitCoinList) {
      var _coin = Coin(
          market: _upbitCoin.marketData.market,
          koreanName: _upbitCoin.marketData.koreanName,
          symbol: _upbitCoin.marketData.market.split('-')[1],
          firstPrice: _upbitCoin,
          secondPrice: secondPrice,
          changeRate: changeRate,
          changePrice: changePrice,
          kimpRate: kimpRate,
          kimpPrice: kimpPrice);
    }
    return _coinList;
  }
}
