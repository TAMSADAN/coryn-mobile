import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/back_app_bar.dart';
import 'package:mobile/components/base_sub_title.dart';
import 'package:mobile/components/detail/detail_title.dart';
import 'package:mobile/components/detail/detail_chart.dart';
import 'package:mobile/components/detail/detail_news.dart';
import 'package:mobile/components/detail/detail_chart_option.dart';
import 'package:mobile/components/detail/detail_news_option.dart';

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
            DetailTitle("obsr_icon1", "옵저버", "OBSR/KRW", "8.9"),
            BaseSubTitle("차트"),
            DetailChart(),
            DetailChartOption(),
            BaseSubTitle("뉴스"),
            DetailNewsOption(),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
            DetailNews("옵저버 이대로 괜찮을까..?", "2021/11/18", "2021/01/14",
                "coinmarcketcal"),
          ],
        ),
      ),
    );
  }
}
