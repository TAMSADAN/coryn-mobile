import 'package:mobile/models/binance_coin.dart';
import 'package:mobile/models/bithumb_coin.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/upbit_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/service/premium_service.dart';

class BithumbService {
  Future<List<BithumbCoin>?> fetchBithumbCoin() async {
    List<BithumbCoin> bithumbCoinList = [];
    bithumbCoinList.addAll(await _fetchBithumbCoin("BTC") ?? []);
    bithumbCoinList.addAll(await _fetchBithumbCoin("KRW") ?? []);

    return bithumbCoinList;
  }

  Future<List<BithumbCoin>?> _fetchBithumbCoin(String target) async {
    List<BithumbCoin> bithumbCoinList = [];

    final response = await http
        .get(Uri.parse("https://api.bithumb.com/public/ticker/ALL_$target"));

    if (response.statusCode == 200) {
      Map<String, dynamic> _json =
          json.decode(utf8.decode(response.bodyBytes))["data"];
      _json.forEach(
        (key, value) {
          try {
            BithumbCoin _bithumbCoin = BithumbCoin.fromJson(value, key, target);
            bithumbCoinList.add(_bithumbCoin);
          } catch (e) {}
        },
      );
    }

    return bithumbCoinList;
  }

  Future<List<Coin>?> parseToCoinList(
      List<BithumbCoin> bithumbCoinList, List<Coin> binanceCoinList) async {
    List<Coin> coinList = [];
    Map<String, double> quotationData = {
      "KRWUSD": await PremiumService().fetchKrwUsd(),
    };
    try {
      for (var _bithumbCoin in bithumbCoinList) {
        String _base = _bithumbCoin.base;
        String _target = _bithumbCoin.target;
        double? _premiumPrice = PremiumService()
            .getPremiumPrice(binanceCoinList, quotationData, _base, _target);
        Coin _coin = Coin(
          platform: "BITHUMB",
          base: _base,
          target: _target,
          koreanName: null,
          englishName: null,
          tradePrice: double.parse(_bithumbCoin.closingPrice) * 1.0,
          changeRate: double.parse(_bithumbCoin.fluctateRate24H) * 1.0,
          changePrice: double.parse(_bithumbCoin.fluctate24H) * 1.0,
          volume: double.parse(_bithumbCoin.accTradeValue24H) * 1.0,
          premiumRate: _premiumPrice != null
              ? (double.parse(_bithumbCoin.closingPrice) * 1.0 / _premiumPrice -
                      1) *
                  100
              : null,
          premiumPrice: _premiumPrice != null
              ? double.parse(_bithumbCoin.closingPrice) * 1.0 - _premiumPrice
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
