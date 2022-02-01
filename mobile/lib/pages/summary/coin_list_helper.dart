import 'package:flutter/material.dart';
import 'components/coin_search_bar.dart';
import 'components/platform_drop_down_button.dart';
import 'components/market_drop_down_button.dart';
import 'components/coin_sort_button.dart';
import 'components/coin_update_text.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinListHelper extends StatelessWidget {
  const CoinListHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoinSearchBar(),
        SizedBox(height: CorynSize.componentVertical),
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
