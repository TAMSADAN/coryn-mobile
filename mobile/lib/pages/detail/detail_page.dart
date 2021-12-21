import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/models/summary.dart';
import 'package:mobile/pages/components/back_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/components/coin/coin_news_list_item.dart';
import 'package:mobile/pages/detail/detail_title.dart';
import 'package:mobile/pages/detail/detail_chart.dart';
import 'package:mobile/pages/detail/detail_chart_option.dart';
import 'package:mobile/pages/detail/detail_news_option.dart';
import 'package:mobile/models/detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            DetailTitle(summary: dummyDetail.summary),
            BaseSubTitle("차트"),
            DetailChart(),
            DetailChartOption(),
            BaseSubTitle("뉴스"),
            DetailNewsOption(),
            ...List.generate(dummyDetail.newsList.length,
                (index) => CoinNewsListItem(news: dummyDetail.newsList[index])),
          ],
        ),
      ),
    );
  }
}
