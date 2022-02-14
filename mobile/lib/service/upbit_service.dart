import 'package:mobile/models/upbit_price.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpbitService {
  Future<List<String>> fetchUpbitMarketList() async {
    List<String> upbitMarketList = [];
    final response =
        await http.get(Uri.parse("https://api.upbit.com/v1/market/all"));
    if (response.statusCode == 200) {
      for (var _ in json.decode(utf8.decode(response.bodyBytes))) {
        upbitMarketList.add(_["market"]);
      }
    }
    // print(upbitMarketList);
    return upbitMarketList;
  }

  Future<List<UpbitPrice>> fetchUpbitPriceList() async {
    List<UpbitPrice> upbitPriceList = [];
    String markets = (await fetchUpbitMarketList()).join(',');
    final response = await http
        .get(Uri.parse("https://api.upbit.com/v1/ticker?markets=$markets"));

    if (response.statusCode == 200) {
      for (var _ in json.decode(utf8.decode(response.bodyBytes))) {
        var upbitPrice = UpbitPrice.fromJson(_);
        upbitPriceList.add(upbitPrice);
      }
    }
    return upbitPriceList;
  }
}
