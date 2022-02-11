import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:mobile/pages/summary/summary_binding.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/pages/summary/coin_list.dart';
import 'components/coin_search_bar.dart';
import 'components/coin_sort_button.dart';
import 'components/coin_update_text.dart';
import 'components/market_drop_down_button.dart';
import 'components/platform_drop_down_button.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SummaryBinding().dependencies();

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
            const CoinSearchBar(),
            const SizedBox(height: CorynSize.componentVertical),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PlatformDropDownButton(),
                MarketDropDownButton(),
              ],
            ),
            const SizedBox(height: CorynSize.componentVertical),
            const CoinSortButton(),
            Container(
              alignment: Alignment.centerRight,
              child: const CoinUpdateText(),
            ),
            const Expanded(child: CoinList()),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}
