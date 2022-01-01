import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/components/coin/coin_news_list_item.dart';
import 'package:mobile/pages/detail/components/detail_title.dart';
import 'package:mobile/pages/detail/components/detail_chart.dart';
import 'package:mobile/pages/detail/components/detail_chart_option.dart';
import 'package:mobile/pages/detail/components/detail_news_option.dart';
import 'package:mobile/models/detail.dart';
import 'package:mobile/models/chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/pages/ad_banner.dart';

class DetailPage extends StatefulWidget {
  final String market;
  final int defaultOption;

  const DetailPage(
      {Key? key, required this.market, required this.defaultOption})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Coin _coin;
  late List<News>? _newsList;
  late List<Price>? _priceList;
  late List<Chart> _chartList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: Colors.white,
              border: Border(),
              largeTitle: Text("상세"),
              previousPageTitle: "홈",
              heroTag: "detail",
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  FutureBuilder(
                      future: fetchCoin(widget.market),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        } else {
                          return DetailTitle(
                            coin: _coin,
                            price:
                                _priceList!.length > 0 ? _priceList![0] : null,
                          );
                        }
                      }),
                  BaseSubTitle("차트"),
                  DetailChart(chartList: _chartList),
                  // DetailChartOption(
                  //     chartOptionController: ChartOptionController),
                  BaseSubTitle("뉴스"),
                  DetailNewsOption(
                    newsOptionController: NewsOptionController,
                    defaultOption: widget.defaultOption,
                  ),
                  if (_newsList != null)
                    ...List.generate(_newsList!.length,
                        (index) => CoinNewsListItem(news: _newsList![index]))
                ],
              ),
            ),
            // AdBanner()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _newsList = [];
    _priceList = [];
    _chartList = [];
    fetchPrice(widget.market);
    fetchNews(widget.market);

    // 뉴스 컴포넌트 초기화
    NewsOptionController(widget.defaultOption);
  }

  // 분, 일, 주, 월 버튼 컨트롤러
  void ChartOptionController(Object value) {
    setState(() {});
  }

  void NewsOptionController(Object value) {
    setState(() {
      List<News>? _goodNewsList = [];
      List<News>? _basicNewsList = [];
      _newsList!.forEach((news) {
        if (news.newsType == "good") {
          _goodNewsList.add(news);
        } else {
          _basicNewsList.add(news);
        }
      });
      // 0 -> good sort, 1 -> basic sort
      _newsList!.clear();
      if (value == 0) {
        _newsList!.addAll([..._basicNewsList, ..._goodNewsList]);
      } else {
        _newsList!.addAll([..._goodNewsList, ..._basicNewsList]);
      }
    });
  }

  Future<bool> fetchCoin(String market) async {
    Coin coin;
    final response =
        await http.get(Uri.http("13.125.161.94:8080", "/api/v1/coins/$market"));

    if (response.statusCode == 200) {
      coin = Coin.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      setState(() {
        _coin = coin;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fetchPrice(String market) async {
    List<Price> priceList = [];
    final response = await http
        .get(Uri.http("13.125.161.94:8080", "/api/v1/coins/$market/prices"));

    if (response.statusCode == 200) {
      for (var priceJson in json.decode(utf8.decode(response.bodyBytes))) {
        var price = Price.fromJson(priceJson);
        priceList.add(price);
      }
      setState(() {
        _priceList!.clear();
        _priceList!.addAll([...priceList]);
        // chartList 초기화
        _chartList = [
          ...List.generate(
              _priceList!.length,
              (index) => Chart(
                    date: index.toString(),
                    price: _priceList![index].openingPrice > 10000
                        ? _priceList![index].openingPrice / 10000
                        : _priceList![index].openingPrice,
                  ))
        ];
      });
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fetchNews(String market) async {
    List<News>? newsList = [];
    final queryParameters = {
      'market': market,
    };
    final response = await http
        .get(Uri.http("13.125.161.94:8080", "/api/v1/news", queryParameters));

    if (response.statusCode == 200) {
      for (var newsJson in json.decode(utf8.decode(response.bodyBytes))) {
        var news = News.fromJson(newsJson);
        newsList.add(news);
      }
      setState(() {
        _newsList!.clear();
        _newsList!.addAll([...newsList]);
      });
      NewsOptionController(widget.defaultOption);
      return true;
    } else {
      return false;
    }
  }
}
