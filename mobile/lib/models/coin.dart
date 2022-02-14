import 'package:intl/intl.dart';

class Coin {
  final String baseSymbol;
  final String quoteSymbol;
  final String koreanName;
  final double upbitPrice;
  final double binancePrice;
  final double changeRate;
  final double changePrice;
  late double kimpRate;
  late double kimpPrice;

  Coin({
    required this.baseSymbol,
    required this.quoteSymbol,
    required this.koreanName,
    required this.upbitPrice,
    required this.binancePrice,
    required this.changeRate,
    required this.changePrice,
  });

  String getFromattedPrice(double price) {
    String formattedPrice;
    var f = NumberFormat('###,###,###,###');

    if (price < 100) {
      formattedPrice = double.parse(price.toStringAsFixed(2)).toString();
    } else {
      formattedPrice = f.format(price.round()).toString();
    }

    return formattedPrice;
  }

  double getScaledRate(double rate) {
    double doubleRate;

    doubleRate = double.parse(rate.toStringAsFixed(2));

    return doubleRate;
  }
}
