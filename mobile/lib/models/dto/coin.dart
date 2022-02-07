import 'package:mobile/models/dto/price.dart';
import 'package:intl/intl.dart';

class Coin {
  final String market;
  final String koreanName;
  final String englishName;
  final String logoUri;
  final Price price;

  Coin({
    required this.market,
    required this.koreanName,
    required this.englishName,
    required this.logoUri,
    required this.price,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        market: json["coin"]["market"],
        koreanName: json["coin"]["korean_name"],
        englishName: json["coin"]["english_name"],
        logoUri: json["coin"]["logo_uri"],
        price: Price.fromJson(json["price"]));
  }

  String getCoinPrice() {
    double price = this.price.tradePrice;
    String market = this.market.split("-")[0];
    String coinPrice = "";

    var f = NumberFormat('###,###,###,###');

    if (price < 100) {
      coinPrice = price.toString();
    } else {
      coinPrice = f.format(price.round()).toString();
    }

    if (market == "KRW") {
      coinPrice += "원";
    } else if (market == "BTC") {
      coinPrice += "BTC";
    }

    return coinPrice;
  }
}
