import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class NormalNewsList extends StatelessWidget {
  const NormalNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "그럴싸한 뉴스 제목",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: CustomFontSizes.normalNewsTitle.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: CustomScreenSizes.contextVertical,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Facebook",
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: CustomFontSizes.normalNewsSource.sp,
                  ),
                ),
                Expanded(child: Text("22/02/16")),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
