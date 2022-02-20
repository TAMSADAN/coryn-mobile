import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/pages/detail/components/good_news_list.dart';
import 'package:mobile/pages/detail/components/trading_view.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';
import 'package:mobile/styles/custom_text_styles.dart';
import 'package:mobile/utils/secrets.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'components/normal_news_list.dart';

class DetailPage extends StatelessWidget {
  final Coin coin;
  const DetailPage({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _detailController = Get.put(DetailController(coin: coin));
    WebViewController _controller;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: CustomScreenSizes.appBarHeight.h,
        leadingWidth: CustomScreenSizes.appBarLeadingWidth.w,
        title: Column(
          children: [
            Text(
              coin.base + '/' + coin.target,
              style: CustomTextStyles.blackBold,
            ),
            Text(
              Secrets.platformData[coin.platform]! + ' (' + coin.platform + ')',
              style: CustomTextStyles.small,
            ),
          ],
        ),
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.delete<DetailController>();
            Navigator.pop(context, true);
          },
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TradingView(),
          Expanded(
            child: Scrollbar(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: CustomScreenSizes.contextHorizontal.w),
                children: [
                  GoodNewsList(),
                  NormalNewsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
