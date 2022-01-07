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
            price: Price.fromJson(json["price"])),
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
