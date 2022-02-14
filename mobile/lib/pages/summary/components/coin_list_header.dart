import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_fonts.dart';
import 'package:mobile/styles/custom_sizes.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinListHeader extends StatelessWidget {
  const CoinListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("이름", MainAxisAlignment.start),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("현재가", MainAxisAlignment.end),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("전일대비", MainAxisAlignment.end),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("김프", MainAxisAlignment.end),
            ),
          ],
        ),
      ],
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
              fontSize: CustomFontSize.subTitle.sp,
            ),
          ),
        ],
      ),
    );
  }
}
