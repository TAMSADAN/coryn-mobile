import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinUpdateText extends StatelessWidget {
  const CoinUpdateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('HH:mm:ss');
    return GetBuilder<CoinListController>(
      builder: (_) => Text("업데이트 시간: " + formatter.format(_.updateTime),
          style: TextStyle(
            color: CustomColors.grey,
            fontFamily: CustomFonts.context,
            fontSize: CustomFontSizes.subContext.sp,
          )),
    );
  }
}
