import 'package:mobile/models/binance_coin.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/upbit_coin.dart';
import 'package:mobile/service/binance_service.dart';
import 'package:mobile/service/upbit_service.dart';

class CoinService {
  Future<List<Coin>?> fetchCoinList(
      String platform, List<Coin> binanceCoinList) async {
    List<Coin>? coinList;
    if (platform.toUpperCase() == "UPBIT") {
      coinList = await _fetchCoinListFromUpbit(binanceCoinList);
    } else if (platform.toUpperCase() == "BINANCE") {
      print("COinService fetchCoinList 바이낸스는 요청이 필요하지 않습니다.");
      return null;
    } else {
      print("CoinService fetchCoinList ${platform} 존재하지 않습니다.");
      return null;
    }

    return coinList;
  }

  Future<List<Coin>?> _fetchCoinListFromUpbit(
      List<Coin> binanceCoinList) async {
    final UpbitService _upbitService = UpbitService();
    final List<UpbitCoin>? _upbitCoinList =
        await _upbitService.fetchUpbitCoin();
    if (_upbitCoinList == null || _upbitCoinList.isEmpty) {
      print(
          "CoinService fetchCoinListFromUpbit _upbitCoinList is null or empty");
      return null;
    }
    final List<Coin>? coinList =
        await _upbitService.parseToCoinList(_upbitCoinList, binanceCoinList);

    return coinList;
  }

  Future<List<Coin>?> fetchCoinListFromBinance() async {
    final BinanceService _binanceService = BinanceService();
    List<BinanceCoin>? _binanceCoinList =
        await _binanceService.fetchBinanceCoin();
    if (_binanceCoinList == null || _binanceCoinList.isEmpty) {
      print(
          "CoinService fetchCoinListFromBinance _binanceCoinList is null or empty");
      return null;
    }
    final List<Coin>? coinList =
        _binanceService.parseCoinList(_binanceCoinList);

    return coinList;
  }

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

  // Future<List<Coin>?> fetchCoinList() async {
  //   try {
  //     List<Coin> coinList = [];
  //     final List<UpbitCoin>? _upbitCoinList =
  //         await UpbitService().fetchUpbitCoin(null);
  //     if (_upbitCoinList == null || _upbitCoinList.isEmpty) {
  //       print("CoinService fetchCoinList _upbitCoinList is null or is empty");
  //       return null;
  //     }
  //     final List<BinanceCoin>? _binanceCoinList =
  //         await BinanceService().fetchBinanceCoin(null);
  //     if (_binanceCoinList == null || _binanceCoinList.isEmpty) {
  //       print("CoinService fetchCoinList _binanceCoinList is null or is empty");
  //       return null;
  //     }
  //     final double _usdPrice = await KimpService().fetchUSD();
  //     final BinanceCoin? _binanceBitcoin = _binanceCoinList
  //         .firstWhereOrNull((_item) => _item.marketData.symbol == 'BTCUSDT');

  //     if (_binanceBitcoin == null) {
  //       print("CoinService fetchCoinList _binanceBitcoin is null");
  //       return null;
  //     }
  //     final double _bitcoinPrice = _binanceBitcoin.priceData.price;

  //     UpbitCoin _upbitBitCoin = _upbitCoinList
  //         .firstWhere((_item) => _item.marketData.market == "KRW-BTC");
  //     Coin _bitcoin = Coin(
  //         baseSymbol: "BTC",
  //         quoteSymbol: "KRW",
  //         koreanName: "비트코인",
  //         upbitPrice: _upbitBitCoin.priceData.tradePrice,
  //         binancePrice: _bitcoinPrice * _usdPrice,
  //         changeRate: _upbitBitCoin.priceData.changeRate,
  //         changePrice: _upbitBitCoin.priceData.changePrice);

  //     _bitcoin.kimpRate =
  //         (_bitcoin.upbitPrice / _bitcoin.binancePrice - 1) * 100;
  //     _bitcoin.kimpPrice = _bitcoin.upbitPrice - _bitcoin.binancePrice;

  //     coinList.add(_bitcoin);

  //     for (var _upbitCoin in _upbitCoinList) {
  //       BinanceCoin? _binanceCoin = _binanceCoinList.firstWhereOrNull((_item) =>
  //           _item.marketData.baseAsset ==
  //               _upbitCoin.marketData.market.split('-')[1] &&
  //           _item.marketData.quoteAsset == 'BTC');
  //       if (_binanceCoin == null) {
  //         continue;
  //       }
  //       Coin _coin = Coin(
  //         baseSymbol: _upbitCoin.marketData.market.split('-')[1],
  //         quoteSymbol: _upbitCoin.marketData.market.split('-')[0],
  //         koreanName: _upbitCoin.marketData.koreanName,
  //         upbitPrice: _upbitCoin.priceData.tradePrice,
  //         binancePrice: _binanceCoinList
  //                 .firstWhere((_item) =>
  //                     _item.marketData.baseAsset ==
  //                         _upbitCoin.marketData.market.split('-')[1] &&
  //                     _item.marketData.quoteAsset == 'BTC')
  //                 .priceData
  //                 .price *
  //             _bitcoinPrice *
  //             _usdPrice,
  //         changeRate: _upbitCoin.priceData.changeRate,
  //         changePrice: _upbitCoin.priceData.changePrice,
  //       );
  //       // print("인풋: " + _coin.baseSymbol);
  //       // print("아웃풋: " + _coin.quoteSymbol);
  //       // print("코인 사토시 가격: " + _coin.binancePrice.toString());
  //       // print("비트코인 가격: " + _bitcoinPrice.toString());
  //       // print("USD 가격: " + _usdPrice.toString());
  //       // print("원화 계산 후 가격: " +
  //       //     (_coin.binancePrice * _bitcoinPrice * _usdPrice).toString());
  //       // print("비트코인 원화 가격: " + (_bitcoinPrice * _usdPrice).toString());
  //       // print("김프: " + _coin.kimpRate.toString());

  //       // print("업비트 가격: " + _coin.upbitPrice.toString());
  //       // print("바이낸스 가격: " + _coin.binancePrice.toString());
  //       _coin.kimpRate = (_coin.upbitPrice / _coin.binancePrice - 1) * 100;
  //       _coin.kimpPrice = _coin.upbitPrice - _coin.binancePrice;
  //       coinList.add(_coin);
  //     }
  //     return coinList;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // Future<List<Coin>> fetchCoinListFromUpbit() async {
  //   List<Coin> _coinList = [];
  //   final List<UpbitCoin> _upbitCoinList =
  //       await UpbitService().fetchUpbitCoin(null);

  //   for (var _upbitCoin in _upbitCoinList) {
  //     var _coin = Coin(
  //         market: _upbitCoin.marketData.market,
  //         koreanName: _upbitCoin.marketData.koreanName,
  //         symbol: _upbitCoin.marketData.market.split('-')[1],
  //         firstPrice: _upbitCoin,
  //         secondPrice: secondPrice,
  //         changeRate: changeRate,
  //         changePrice: changePrice,
  //         kimpRate: kimpRate,
  //         kimpPrice: kimpPrice);
  //   }
  //   return _coinList;
  // }
}
