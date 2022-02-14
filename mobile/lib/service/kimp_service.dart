import 'package:mobile/models/binance_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KimpService {
  Future<double> fetchUSD() async {
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
}
