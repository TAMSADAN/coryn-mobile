import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/custom_text_styles.dart';
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
              child: _text("이름", CrossAxisAlignment.start),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("현재가", CrossAxisAlignment.end),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("전일대비", CrossAxisAlignment.end),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal.w,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 5,
              child: _text("김프", CrossAxisAlignment.end),
            ),
          ],
        ),
      ],
    );
  }

  Widget _text(String text, CrossAxisAlignment cross) {
    return Column(
      crossAxisAlignment: cross,
      children: [
        Text(
          text,
          style: CustomTextStyles.blackNormal,
        ),
      ],
    );
  }
}
