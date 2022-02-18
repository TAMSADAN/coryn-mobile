import 'package:mobile/models/binance_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/models/coin.dart';

class PremiumService {
  Future<double> fetchKrwUsd() async {
    double usd = 0.0;

    final response = await http.get(Uri.parse(
        "https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.KRWUSD"));

    if (response.statusCode == 200) {
      try {
        usd = json.decode(utf8.decode(response.bodyBytes))[0]['basePrice'];
      } catch (e) {
        print("kimpService json parsing error");
      }
    }
    return usd;
  }

  double? getBinancePrice(
      List<Coin> binanceCoinList, String base, String target) {
    double? usdtFromBtcPrice;

    for (Coin _coin in binanceCoinList) {
      if (_coin.base == base && _coin.target == target) {
        usdtFromBtcPrice = _coin.tradePrice;
        break;
      }
    }

    return usdtFromBtcPrice;
  }

  double? getPremiumPrice(List<Coin> binanceCoinList,
      Map<String, double> quotationData, String base, String target) {
    double? _binanceBtcUsdtPrice =
        getBinancePrice(binanceCoinList, "BTC", "USDT");
    if (_binanceBtcUsdtPrice == null || _binanceBtcUsdtPrice == 0) {
      print("PremiumService getPremiumPrice: _binanceBtcUsdtPrice is null");
      return null;
    }

    double? _binanceBaseTargetPrice;
    if (base != "BTC") {
      _binanceBaseTargetPrice = getBinancePrice(binanceCoinList, base, "BTC");
      if (_binanceBaseTargetPrice == null || _binanceBaseTargetPrice == 0) {
        print(
            "PremiumService getPremiumPrice: _binanceBaseTargetPrice is null");
        return null;
      }
    }
    if (quotationData.containsKey(target + "USD")) {
      if (base == "BTC") {
        return _binanceBtcUsdtPrice * quotationData[target + "USD"]!;
      }
      return _binanceBtcUsdtPrice *
          _binanceBaseTargetPrice! *
          quotationData[target + "USD"]!;
    } else {
      print("PremiumService getPremiumPrice: quotationData not key");
      return null;
    }
  }
}


//       final double _usdPrice = await KimpService().fetchUSD();
//       final BinanceCoin? _binanceBitcoin = _binanceCoinList
//           .firstWhereOrNull((_item) => _item.marketData.symbol == 'BTCUSDT');

//       if (_binanceBitcoin == null) {
//         print("CoinService fetchCoinList _binanceBitcoin is null");
//         return null;
//       }
//       final double _bitcoinPrice = _binanceBitcoin.priceData.price;

//       UpbitCoin _upbitBitCoin = _upbitCoinList
//           .firstWhere((_item) => _item.marketData.market == "KRW-BTC");
//       Coin _bitcoin = Coin(
//           baseSymbol: "BTC",
//           quoteSymbol: "KRW",
//           koreanName: "비트코인",
//           upbitPrice: _upbitBitCoin.priceData.tradePrice,
//           binancePrice: _bitcoinPrice * _usdPrice,
//           changeRate: _upbitBitCoin.priceData.changeRate,
//           changePrice: _upbitBitCoin.priceData.changePrice);

//       _bitcoin.kimpRate =
//           (_bitcoin.upbitPrice / _bitcoin.binancePrice - 1) * 100;
//       _bitcoin.kimpPrice = _bitcoin.upbitPrice - _bitcoin.binancePrice;

//       coinList.add(_bitcoin);

//       for (var _upbitCoin in _upbitCoinList) {
//         BinanceCoin? _binanceCoin = _binanceCoinList.firstWhereOrNull((_item) =>
//             _item.marketData.baseAsset ==
//                 _upbitCoin.marketData.market.split('-')[1] &&
//             _item.marketData.quoteAsset == 'BTC');
//         if (_binanceCoin == null) {
//           continue;
//         }
//         Coin _coin = Coin(
//           baseSymbol: _upbitCoin.marketData.market.split('-')[1],
//           quoteSymbol: _upbitCoin.marketData.market.split('-')[0],
//           koreanName: _upbitCoin.marketData.koreanName,
//           upbitPrice: _upbitCoin.priceData.tradePrice,
//           binancePrice: _binanceCoinList
//                   .firstWhere((_item) =>
//                       _item.marketData.baseAsset ==
//                           _upbitCoin.marketData.market.split('-')[1] &&
//                       _item.marketData.quoteAsset == 'BTC')
//                   .priceData
//                   .price *
//               _bitcoinPrice *
//               _usdPrice,
//           changeRate: _upbitCoin.priceData.changeRate,
//           changePrice: _upbitCoin.priceData.changePrice,
//         );
//         // print("인풋: " + _coin.baseSymbol);
//         // print("아웃풋: " + _coin.quoteSymbol);
//         // print("코인 사토시 가격: " + _coin.binancePrice.toString());
//         // print("비트코인 가격: " + _bitcoinPrice.toString());
//         // print("USD 가격: " + _usdPrice.toString());
//         // print("원화 계산 후 가격: " +
//         //     (_coin.binancePrice * _bitcoinPrice * _usdPrice).toString());
//         // print("비트코인 원화 가격: " + (_bitcoinPrice * _usdPrice).toString());
//         // print("김프: " + _coin.kimpRate.toString());

//         // print("업비트 가격: " + _coin.upbitPrice.toString());
//         // print("바이낸스 가격: " + _coin.binancePrice.toString());
//         _coin.kimpRate = (_coin.upbitPrice / _coin.binancePrice - 1) * 100;
//         _coin.kimpPrice = _coin.upbitPrice - _coin.binancePrice;
// }