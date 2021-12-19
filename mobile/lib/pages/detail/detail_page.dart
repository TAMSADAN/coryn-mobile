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
      appBar: BackAppBar(AppBar(), "상세 정보"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            DetailTitle(summary: bitcoinDetail.summary),
            BaseSubTitle("차트"),
            DetailChart(),
            DetailChartOption(),
            BaseSubTitle("뉴스"),
            DetailNewsOption(),
            ...List.generate(
                bitcoinDetail.newsList.length,
                (index) =>
                    CoinNewsListItem(news: bitcoinDetail.newsList[index]))
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
            // DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
            //     "coinmarcketcal"),
          ],
        ),
      ),
    );
  }
}
