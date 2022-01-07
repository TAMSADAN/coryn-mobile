import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/detail/components/detail_title.dart';
import 'package:mobile/pages/detail/components/detail_chart.dart';
import 'package:mobile/pages/detail/components/detail_chart_option.dart';
import 'package:mobile/models/chart.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:mobile/models/detail_model.dart';
import 'package:mobile/pages/detail/components/detail_news.dart';

/*
  [page] DetailPage

  body
  - DetailTitle         코인 정보
  - BaseSubTitle        소제목 "차트"
  - DetailChart         코인 차트
  - DetailChartOption   코인 차트 옵션
  - BaseSubTitle        소제목 "뉴스"
  - DetailNewsOption    코인 뉴스 옵션 "날짜 우선", "호재 우선"
  - DetailNewsItem      코인 뉴스
*/

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
  final _detailModel = DetailModel();

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
            const CupertinoSliverNavigationBar(
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
                      future: _detailModel.fetchCoin(widget.market),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return Center(child: CupertinoActivityIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DetailTitle(coin: snapshot.data);
                        }
                      }),
                  BaseSubTitle("차트"),
                  FutureBuilder(
                      future: _detailModel.fetchChartList(widget.market),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return Center(child: CupertinoActivityIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DetailChart(chartList: snapshot.data);
                        }
                      }),
                  const BaseSubTitle("뉴스"),
                  FutureBuilder(
                      future: _detailModel.fetchNewsList(widget.market),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return Center(child: CupertinoActivityIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DetailNews(newsList: snapshot.data, option: 0);
                        }
                      }),
                ],
              ),
            ),
            AdBanner()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
