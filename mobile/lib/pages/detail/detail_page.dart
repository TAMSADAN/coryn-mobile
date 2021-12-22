import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/summary.dart';
import 'package:mobile/pages/components/back_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/components/coin/coin_news_list_item.dart';
import 'package:mobile/pages/detail/detail_title.dart';
import 'package:mobile/pages/detail/detail_chart.dart';
import 'package:mobile/pages/detail/detail_chart_option.dart';
import 'package:mobile/pages/detail/detail_news_option.dart';
import 'package:mobile/models/detail.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/models/chart.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Detail _detail;
  late List<News>? _newsList;
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            DetailTitle(detail: _detail),
            BaseSubTitle("차트"),
            DetailChart(chartList: _chartList),
            // DetailChartOption(chartOptionController: ChartOptionController),
            BaseSubTitle("뉴스"),
            DetailNewsOption(newsOptionController: NewsOptionController),
            ...List.generate(_detail.newsList!.length,
                (index) => CoinNewsListItem(news: _newsList![index])),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _detail = dummyBitcoinDetail;
    _chartList = [
      ...List.generate(
          _detail.priceList.length,
          (index) => Chart(
                date: index.toString(),
                price: _detail.priceList[index].openingPrice,
              ))
    ];
    _newsList = _detail.newsList;
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
        print("컨트롤러");
        if (news.type == "good") {
          _goodNewsList.add(news);
        } else {
          _basicNewsList.add(news);
        }
      });
      // 0 -> good sort, 1 -> basic sort
      _newsList!.clear();
      if (value == 0) {
        print("호재 우선 버튼 클릭");
        _newsList!.addAll([..._basicNewsList, ..._goodNewsList]);
      } else {
        print("날짜 우선 버튼 클릭");
        _newsList!.addAll([..._goodNewsList, ..._basicNewsList]);
      }
    });
  }
}

// class DetailPage extends StatelessWidget {
//   const DetailPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
//           return <Widget>[
//             CupertinoSliverNavigationBar(
//               backgroundColor: Colors.white,
//               border: Border(),
//               largeTitle: Text("상세"),
//               previousPageTitle: "홈",
//             ),
//           ];
//         },
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             DetailTitle(detail: dummyBitcoinDetail),
//             BaseSubTitle("차트"),
//             DetailChart(),
//             DetailChartOption(),
//             BaseSubTitle("뉴스"),
//             DetailNewsOption(),
//             ...List.generate(
//                 dummyBitcoinDetail.newsList!.length,
//                 (index) => CoinNewsListItem(
//                     news: dummyBitcoinDetail.newsList![index])),
//           ],
//         ),
//       ),
//     );
//   }
// }
