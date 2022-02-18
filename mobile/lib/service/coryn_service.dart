import 'package:mobile/models/dto/news.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/utils/secrets.dart';

class CorynService {
  String parseToNewsUrl(String base, String type, int limit) {
    String url = Secrets.corynBaseUrl +
        "/news?ticker=$base&type=$type&limit=${limit.toString()}";
    return url;
  }

  Future<List<News>?> fetchNews(String base, String type, int limit) async {
    final String _newsUrl = parseToNewsUrl(base, type, limit);
    final response = await http.get(Uri.parse(_newsUrl));
    List<News> newsList = [];

    try {
      if (response.statusCode == 200) {
        for (var _json
            in json.decode(utf8.decode(response.bodyBytes))["news"]) {
          print(_json);
          News _news = News.fromJson(_json);

          newsList.add(_news);
        }
        return newsList;
      } else {
        print("CorynService fetchNews: response status not ok");
        return [];
      }
    } catch (e) {
      print("CorynService fetchNews: parse error");
      return null;
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
