import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/detail/components/coin_info.dart';
import 'package:mobile/pages/detail/components/detail_chart.dart';
import 'package:mobile/pages/detail/components/news_cards.dart';
import 'package:mobile/pages/detail/components/news_items.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final String market;
  const DetailPage({Key? key, required this.market}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _detailController = Get.put(DetailController(market: market));

    return GetBuilder<DetailController>(
      builder: (_) => _.isLoading != 0
          ? Scaffold(
              body: Center(child: CupertinoActivityIndicator()),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 30,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Get.delete<DetailController>();
                    Navigator.pop(context);
                  },
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    CorynSize.pageHorizontal,
                    CorynSize.pageVertical,
                    CorynSize.pageHorizontal,
                    0.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoinInfo(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              _.coin.getCoinPrice(),
                              style: CorynTextStyle.largeBoldTextStyle,
                            ),
                          ),
                        ],
                      ),
                      DetailChart(chartList: _.chartList),
                      Text(
                        "일정",
                        style: CorynTextStyle.xLargeBoldTextStyle,
                      ),
                      SizedBox(
                        height: 170,
                        child: NewsCards(),
                      ),
                      Text(
                        "뉴스",
                        style: CorynTextStyle.xLargeBoldTextStyle,
                      ),
                      NewsItems(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:mobile/models/dto/coin.dart';
// import 'package:mobile/models/dto/news.dart';
// import 'package:mobile/models/dto/price.dart';
// import 'package:mobile/pages/components/base_sub_title.dart';
// import 'package:mobile/pages/detail/components/detail_title.dart';
// import 'package:mobile/pages/detail/components/detail_chart.dart';
// import 'package:mobile/pages/detail/components/detail_chart_option.dart';
// import 'package:mobile/models/chart.dart';
// import 'package:mobile/pages/ad_banner.dart';
// import 'package:mobile/models/detail_model.dart';
// import 'package:mobile/pages/detail/components/detail_news.dart';

// /*
//   [page] DetailPage

//   body
//   - DetailTitle         코인 정보
//   - BaseSubTitle        소제목 "차트"
//   - DetailChart         코인 차트
//   - DetailChartOption   코인 차트 옵션
//   - BaseSubTitle        소제목 "뉴스"
//   - DetailNewsOption    코인 뉴스 옵션 "날짜 우선", "호재 우선"
//   - DetailNewsItem      코인 뉴스
// */

// class DetailPage extends StatefulWidget {
//   final String market;
//   final int defaultOption;

//   const DetailPage(
//       {Key? key, required this.market, required this.defaultOption})
//       : super(key: key);

//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   final _detailModel = DetailModel();

//   late Coin _coin;
//   late List<News>? _newsList;
//   late List<Price>? _priceList;
//   late List<Chart> _chartList;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
//           return <Widget>[
//             const CupertinoSliverNavigationBar(
//               backgroundColor: Colors.white,
//               border: Border(),
//               largeTitle: Text("상세"),
//               previousPageTitle: "홈",
//               heroTag: "detail",
//             ),
//           ];
//         },
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 children: [
//                   FutureBuilder(
//                       future: _detailModel.fetchCoin(widget.market),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.hasData == false) {
//                           return Center(child: CupertinoActivityIndicator());
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           return DetailTitle(coin: snapshot.data);
//                         }
//                       }),
//                   BaseSubTitle("차트"),
//                   FutureBuilder(
//                       future: _detailModel.fetchChartList(widget.market),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.hasData == false) {
//                           return Center(child: CupertinoActivityIndicator());
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           return DetailChart(chartList: snapshot.data);
//                         }
//                       }),
//                   const BaseSubTitle("뉴스"),
//                   FutureBuilder(
//                       future: _detailModel.fetchNewsList(widget.market),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.hasData == false) {
//                           return Center(child: CupertinoActivityIndicator());
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           return DetailNews(newsList: snapshot.data, option: 0);
//                         }
//                       }),
//                 ],
//               ),
//             ),
//             AdBanner()
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//   }
// }
