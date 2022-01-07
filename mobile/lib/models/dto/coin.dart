import 'package:mobile/models/dto/price.dart';

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
}
