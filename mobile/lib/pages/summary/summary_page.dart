import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/models/summary_model.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'coin_list_helper.dart';
import 'coin_list.dart';

// import 'package:mobile/models/summary.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:mobile/pages/summary/components/summary_body.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final _summaryModel = SummaryModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xfff2f2f6),
        backgroundColor: const Color(0000000),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
            CorynSize.pageHorizontal,
            CorynSize.pageVertical,
            CorynSize.pageHorizontal,
            0.0,
          ),
          child: Column(
            children: [
              CoinListHelper(),
              Expanded(
                child: CoinList(),
              ),
              // Expanded(
              //   child: ListView(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     children: [
              //       FutureBuilder(
              //           future: _summaryModel.fetchKrwCoinList(),
              //           builder: (BuildContext context, AsyncSnapshot snapshot) {
              //             if (snapshot.hasData == false) {
              //               return const Center(
              //                   child: CupertinoActivityIndicator());
              //             } else if (snapshot.hasError) {
              //               return Text('Error: ${snapshot.error}');
              //             } else {
              //               return SummaryBody(coinList: snapshot.data);
              //             }
              //           }),
              //     ],
              //   ),
              // ),
              const AdBanner(),
            ],
          ),
        ));
  }
}
