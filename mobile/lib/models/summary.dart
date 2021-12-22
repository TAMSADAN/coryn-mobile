import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/price.dart';

class Summary {
  final Coin coin;
  final Price price;

  Summary({
    required this.coin,
    required this.price,
  });
}

List<Summary> dummySummaryList = [
  Summary(coin: dummyBitcoinCoin, price: dummyBitcoinPriceList[0]),
  Summary(coin: dummyDogecoinCoin, price: dummyDogecoinPriceList[0]),
  Summary(coin: dummyStacksCoin, price: dummyStacksPriceList[0]),
];

  // Summary(
  //   coinName: "비트코인",
  //   coinImageUri: "https://static.upbit.com/logos/BTC.png",
  //   coinPrice: 5944000000,
  //   coinTicker: "BTC",
  //   coinMarket: "KRW",
  //   dayRange: 12.4,
  // ),
  // Summary(
  //   coinName: "도지코인",
  //   coinImageUri: "https://static.upbit.com/logos/DOGE.png",
  //   coinPrice: 215,
  //   coinTicker: "DOGE",
  //   coinMarket: "KRW",
  //   dayRange: 7.4,
  // ),
  // Summary(
  //   coinName: "스택스",
  //   coinImageUri: "https://static.upbit.com/logos/STX.png",
  //   coinPrice: 2705,
  //   coinTicker: "STX",
  //   coinMarket: "KRW",
  //   dayRange: -3.2,
  // )