import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/detail/components/coin_info.dart';
import 'package:mobile/pages/detail/components/coin_chart.dart';
import 'package:mobile/pages/detail/components/coin_good_news_list.dart';
import 'package:mobile/pages/detail/components/coin_normal_news_list.dart';
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
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 30,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
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
              children: const [
                CoinInfo(),
                CoinChart(),
                Text(
                  "일정",
                  style: CorynTextStyle.xLargeBoldTextStyle,
                ),
                SizedBox(
                  height: 170,
                  child: CoinGoodNewsList(),
                ),
                Text(
                  "뉴스",
                  style: CorynTextStyle.xLargeBoldTextStyle,
                ),
                CoinNormalNewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
