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
  const CoinListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinListController>(
      builder: (_) => Padding(
        padding:
            EdgeInsets.only(bottom: CustomScreenSizes.coinListPaddingHeight.h),
        child: Row(
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("이름", MainAxisAlignment.start),
            ),
            Spacer(),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("현재가", MainAxisAlignment.end),
            ),
            SizedBox(
              width: CustomScreenSizes.coinListItemPaddingWidth.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("전일대비", MainAxisAlignment.end),
            ),
            if (_.selectedPlatform != "BINANCE" && _.selectedTarget == "KRW")
              Row(
                children: [
                  SizedBox(
                    width: CustomScreenSizes.coinListItemPaddingWidth.w,
                  ),
                  SizedBox(
                    width: ScreenUtil().screenWidth / 5,
                    child: _text("프리미엄", MainAxisAlignment.end),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _text(String text, MainAxisAlignment mainAxis) {
    final _coinListController = Get.find<CoinListController>();
    return GestureDetector(
      onTap: () => _coinListController.updateSortType(text),
      child: Row(
        mainAxisAlignment: mainAxis,
        children: [
          Text(
            text,
            style: TextStyle(
              color: CustomColors.black,
              fontFamily: CustomFonts.context,
              fontSize: CustomFontSizes.subTitle.sp,
            ),
          ),
        ],
      ),
    );
  }
}
