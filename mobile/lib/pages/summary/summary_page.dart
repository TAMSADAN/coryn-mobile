import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/pages/summary/coin_list_helper.dart';
import 'package:mobile/pages/summary/coin_list.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}
