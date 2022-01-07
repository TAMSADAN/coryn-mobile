import 'package:mobile/models/dto/price.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PriceService {
  Future<List<Price>> fetchPriceList(String market) async {
    List<Price> priceList = [];
    final response = await http
        .get(Uri.http("13.125.161.94:8080", "/api/v1/coins/$market/prices"));

    if (response.statusCode == 200) {
      for (var priceJson in json.decode(utf8.decode(response.bodyBytes))) {
        var price = Price.fromJson(priceJson);
        priceList.add(price);
      }
      return priceList;
    } else {
      return Future.error("fetch price list failed");
    }
  }
}
