import 'package:mobile/models/dto/news.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  Future<List<News>> fetchMarketNews(String market) async {
    List<News> _newsList = [];
    final _queryParameters = {
      'market': market,
    };
    final response = await http
        .get(Uri.http("13.125.161.94:8080", "/api/v1/news", _queryParameters));

    if (response.statusCode == 200) {
      for (var newsJson in json.decode(utf8.decode(response.bodyBytes))) {
        var _news = News.fromJson(newsJson);
        _newsList.add(_news);
      }
      return _newsList;
    } else {
      return Future.error("fetch market news failed");
    }
  }

  Future<List<News>> fetchGoodNews() async {
    List<News> _newsList = [];
    final queryParameters = {
      "type": "good",
    };
    final response = await http
        .get(Uri.http("13.125.161.94:8080", "/api/v1/news", queryParameters));

    if (response.statusCode == 200) {
      for (var newsJson in json.decode(utf8.decode(response.bodyBytes))) {
        var _news = News.fromJson(newsJson);
        _newsList.add(_news);
      }
      return _newsList;
    } else {
      return Future.error("fetch good news failed");
    }
  }
}
