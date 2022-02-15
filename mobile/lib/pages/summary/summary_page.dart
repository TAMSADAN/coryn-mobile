import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:mobile/pages/summary/components/market_drop_down_button.dart';
import 'package:mobile/pages/summary/components/platform_drop_down_button.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/pages/summary/components/coin_list.dart';
import 'package:mobile/pages/summary/components/coin_search_bar.dart';
import 'package:mobile/pages/summary/components/coin_update_text.dart';
import 'components/coin_list_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoinListController _coinListController =
        Get.put(CoinListController());

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
            SizedBox(
              height: CustomScreenSizes.componentVertical.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlatformDropDownButton(),
                MarketDropDownButton(),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const CoinUpdateText(),
            ),
            SizedBox(
              height: CustomScreenSizes.contextVertical.h,
            ),
            CoinListHeader(),
            const Expanded(child: CoinList()),
            const AdBanner(),
          ],
        ),
      ),
    );
  }
}
