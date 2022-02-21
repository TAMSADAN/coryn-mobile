import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class CoinUpdateText extends StatelessWidget {
  final double _itemHeight = CustomScreenSizes.itemHeight.h;

  CoinUpdateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('HH:mm:ss');
    return GetBuilder<CoinListController>(
      builder: (_) => SizedBox(
        height: _itemHeight,
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text("업데이트 시간: " + formatter.format(_.updatedTime),
              style: TextStyle(
                color: CustomColors.grey,
              )),
        ),
      ),
    );
  }
}
