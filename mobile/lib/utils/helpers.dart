import 'package:intl/intl.dart';

class Helpers {
  static String parseToScaledRateText(double rate) {
    String scaledRateText;

    scaledRateText = rate.toStringAsFixed(2);

    return scaledRateText;
  }

  static String parseToFormattedText(double value) {
    String formattedPrice;
    var f = NumberFormat('###,###,###,###');

    if (value < 1) {
      formattedPrice = value.toString();
    } else {
      formattedPrice = f.format(value.round()).toString();
    }

    return formattedPrice;
  }
}
