import 'package:flutter/material.dart';
import 'package:mobile/pages/summary/components/coin_search_bar.dart';
import 'package:mobile/pages/summary/components/platform_drop_down_button.dart';
import 'package:mobile/pages/summary/components/market_drop_down_button.dart';
import 'package:mobile/pages/summary/components/coin_sort_button.dart';
import 'package:mobile/pages/summary/components/coin_update_text.dart';
import 'package:mobile/pages/summary/coin_list.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinListHelper extends StatelessWidget {
  const CoinListHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoinSearchBar(),
        SizedBox(height: CorynSize.componentDefaultVertical),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueAccent),
                ),
                SizedBox(width: 10),
                PlaformDropDownButton(),
              ],
            ),
            MarketDropDownButton(),
          ],
        ),
        SizedBox(height: CorynSize.componentDefaultVertical),
        CoinSortButton(),
        Container(
          alignment: Alignment.centerRight,
          child: CoinUpdateText(),
        ),
      ],
    );
  }
}
