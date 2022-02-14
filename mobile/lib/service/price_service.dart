import 'package:mobile/models/upbit_price.dart';
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

  Future<List<UpbitPrice>> fetchUpbitPriceList() async {
    List<UpbitPrice> upbitPriceList = [];

    final response = await http.get(
        Uri.parse("https://api.upbit.com/v1/ticker?markets=KRW-BTC,BTC-ETH"));

    if (response.statusCode == 200) {
      for (var _ in json.decode(utf8.decode(response.bodyBytes))) {
        upbitPriceList.add(UpbitPrice.fromJson(_));
      }
    }
    print(upbitPriceList);
    return upbitPriceList;
  }
}
