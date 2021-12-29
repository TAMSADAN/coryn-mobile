import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/price.dart';

class Summary {
  final Coin coin;
  final Price price;

  Summary({
    required this.coin,
    required this.price,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
        coin: Coin(
          market: json["coin"]["market"],
          koreanName: json["coin"]["korean_name"],
          englishName: json["coin"]["english_name"],
          logoUri: json["coin"]["logo_uri"],
        ),
        price: Price(
          id: json["price"]["id"],
          market: json["price"]["market"],
          openingPrice: json["price"]["opening_price"],
          highPrice: json["price"]["high_price"],
          lowPrice: json["price"]["low_price"],
          tradePrice: json["price"]["trade_price"],
          closedPrice: json["price"]["closed_price"],
          changeRate: json["price"]["change_rate"] * 100,
          changePrice: json["price"]["change_price"],
          tradeVolume: json["price"]["trade_volume"],
          timestamp:
              DateTime.fromMillisecondsSinceEpoch(json["price"]["timestamp"]),
          source: json["price"]["source"],
          unit: json["price"]["unit"],
          currency: json["price"]["currency"],
        ));
  }
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