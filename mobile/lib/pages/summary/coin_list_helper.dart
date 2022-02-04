import 'package:flutter/material.dart';
import 'package:mobile/pages/summary/components/coin_search_bar.dart';
import 'package:mobile/pages/summary/components/platform_drop_down_button.dart';
import 'package:mobile/pages/summary/components/market_drop_down_button.dart';
import 'package:mobile/pages/summary/components/coin_sort_button.dart';
import 'package:mobile/pages/summary/components/coin_update_text.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinListHelper extends StatelessWidget {
  const CoinListHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CoinSearchBar(),
        SizedBox(height: CorynSize.componentVertical),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PlatformDropDownButton(),
            MarketDropDownButton(),
          ],
        ),
        SizedBox(height: CorynSize.componentVertical),
        CoinSortButton(),
        Container(
          alignment: Alignment.centerRight,
          child: CoinUpdateText(),
        ),
      ],
    );
  }
}
