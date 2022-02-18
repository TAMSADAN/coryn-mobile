import 'package:mobile/models/binance_coin.dart';
import 'package:mobile/models/bithumb_coin.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/coinone_coin.dart';
import 'package:mobile/models/upbit_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/service/premium_service.dart';

class CoinoneService {
  Future<List<CoinoneCoin>?> fetchCoinoneCoin() async {
    List<CoinoneCoin> coinoneCoinList = [];

    final response = await http
        .get(Uri.parse("https://api.coinone.co.kr/ticker_utc/?currency=all"));

    if (response.statusCode == 200) {
      Map<String, dynamic> _json = json.decode(utf8.decode(response.bodyBytes));
      _json.forEach(
        (key, value) {
          try {
            CoinoneCoin _coinoneCoin = CoinoneCoin.fromJson(value, "KRW");
            coinoneCoinList.add(_coinoneCoin);
          } catch (e) {}
        },
      );
    }
    return coinoneCoinList;
  }

  Future<List<Coin>?> parseToCoinList(
      List<CoinoneCoin> coinoneCoinList, List<Coin> binanceCoinList) async {
    List<Coin> coinList = [];
    Map<String, double> quotationData = {
      "KRWUSD": await PremiumService().fetchKrwUsd(),
    };
    try {
      for (var _coinoneCoin in coinoneCoinList) {
        String _base = _coinoneCoin.currency.toUpperCase();
        String _target = _coinoneCoin.target;
        double? _premiumPrice = PremiumService()
            .getPremiumPrice(binanceCoinList, quotationData, _base, _target);
        Coin _coin = Coin(
          platform: "COINONE",
          base: _base,
          target: _target,
          koreanName: null,
          englishName: null, //어제 100원이였는데 오늘 80이 됐다. (80 - 100 / 100 * 100
          tradePrice: double.parse(_coinoneCoin.last) * 1.0,
          changeRate: (double.parse(_coinoneCoin.last) -
                  double.parse(_coinoneCoin.first)) /
              double.parse(_coinoneCoin.first) *
              100,
          changePrice: double.parse(_coinoneCoin.last) -
              double.parse(_coinoneCoin.first),
          volume: double.parse(_coinoneCoin.volume) * 1.0,
          premiumRate: _premiumPrice != null
              ? (double.parse(_coinoneCoin.last) * 1.0 / _premiumPrice - 1) *
                  100
              : null,
          premiumPrice: _premiumPrice != null
              ? double.parse(_coinoneCoin.last) * 1.0 - _premiumPrice
              : null,
        );
        coinList.add(_coin);
      }
      return coinList;
    } catch (e) {
      print("UpbitService parseToCoinList parse error");
      return null;
    }
  }
}
