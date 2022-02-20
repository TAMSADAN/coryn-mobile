import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class NormalNewsItem extends StatelessWidget {
  final News news;

  final double _newsTagPadding = CustomScreenSizes.newsTagPadding.w;

  NormalNewsItem({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 뉴스 태그
        Container(
          padding: EdgeInsets.fromLTRB(_newsTagPadding, 0, _newsTagPadding, 0),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Text(
            "구글 뉴스",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: CustomFontSizes.goodNewsDday.sp,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  CustomScreenSizes.goodNewsDdayBoxPaddingWidth.w,
                  0,
                  CustomScreenSizes.goodNewsDdayBoxPaddingWidth.w,
                  0),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Text(
                "구글 뉴스",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: CustomFontSizes.goodNewsDday.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: CustomScreenSizes.newsItemVertical.h),
        Text(
          news.title,
          style: TextStyle(
            color: CustomColors.black,
            fontSize: CustomFontSizes.normalNewsTitle.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: CustomScreenSizes.newsItemVertical.h),
        Row(
          children: [
            Text(
              _parseToStringDate(news.postedDate!),
              style: TextStyle(
                color: CustomColors.black,
                fontSize: CustomFontSizes.normalNewsSource.sp,
              ),
            ),
            Spacer(),
            Text(
              news.source,
              style: TextStyle(
                color: CustomColors.black,
                fontSize: CustomFontSizes.normalNewsSource.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _parseToStringDate(DateTime date) {
    String stringDate = "";

    stringDate += date.year.toString().replaceRange(0, 2, "") + "년";
    stringDate += date.month.toString().padLeft(2, '0') + "월";
    stringDate += date.day.toString().padLeft(2, '0') + '일';

    return stringDate;
  }
}
