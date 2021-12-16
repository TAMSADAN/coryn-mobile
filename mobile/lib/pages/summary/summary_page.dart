import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/summary/summary_search.dart';
import 'package:mobile/pages/summary/summary_coin_list_item.dart';
import 'package:mobile/pages/list_cover.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f6),
      appBar: BaseAppBar(AppBar(), "홈"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            SummarySearch(),
            BaseSubTitle("전체 코인"),
            ListCover(
              Column(
                children: [
                  SummaryCoinListItem(
                      "bitcoin_icon1", "비트코인", "BTC/KRW", "67,330,729", "15.8"),
                  Container(
                      padding: const EdgeInsets.only(left: 58),
                      child: Divider(color: Colors.black, thickness: 0.1)),
                  SummaryCoinListItem(
                      "bitcoin_icon1", "비트코인", "BTC/KRW", "670,729", "15.8"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
