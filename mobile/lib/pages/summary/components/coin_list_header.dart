import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_fonts.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class CoinListHeader extends StatelessWidget {
  final double _itemWidth = ScreenUtil().screenWidth / 5.0;
  final double _itemHeight = CustomScreenSizes.itemHeight.h;
  final double _itemHorizontalSpace = CustomScreenSizes.itemHorizontal.w;
  final double _itemImageHorizontalSpace =
      CustomScreenSizes.itemHorizontal.w / 2.0;

  CoinListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinListController>(
      builder: (_) => Padding(
        padding:
            EdgeInsets.only(bottom: CustomScreenSizes.coinListPaddingHeight.h),
        child: Row(
          children: [
            SizedBox(
              width: _itemWidth,
              height: _itemHeight,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
                child: _text("코인"),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: _itemWidth,
              height: _itemHeight,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerRight,
                child: _text("현재가"),
              ),
            ),
            SizedBox(width: _itemHorizontalSpace),
            SizedBox(
              width: _itemWidth,
              height: _itemHeight,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerRight,
                child: _text("전일대비"),
              ),
            ),
            if (_.selectedPlatform != "BINANCE" && _.selectedTarget == "KRW")
              Row(
                children: [
                  SizedBox(width: _itemHorizontalSpace),
                  SizedBox(
                    width: _itemWidth,
                    height: _itemHeight,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.centerRight,
                      child: _text("프리미엄"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _text(String text) {
    final _coinListController = Get.find<CoinListController>();
    return GestureDetector(
      onTap: () => _coinListController.updateSortType(text),
      child: Text(text, style: const TextStyle(color: CustomColors.black)),
    );
  }
}
