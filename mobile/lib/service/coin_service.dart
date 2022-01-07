import 'package:mobile/models/dto/coin.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinService {
  Future<Coin> fetchCoin(String market) async {
    Coin coin;
    final response =
        await http.get(Uri.http("13.125.161.94:8080", "/api/v1/coins/$market"));

    if (response.statusCode == 200) {
      coin = Coin.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      return coin;
    } else {
      return Future.error("fetch coin failed");
    }
  }
}
