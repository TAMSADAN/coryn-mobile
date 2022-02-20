import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class GoodNewsItem extends StatelessWidget {
  final News news;

  final double _itemHeight = CustomScreenSizes.itemHeight.h;
  final double _itemHorizontalSpace = CustomScreenSizes.itemHorizontal.w;
  final double _newsTagPadding = CustomScreenSizes.newsTagPadding.w;
  final double _itemVerticalSpace = CustomScreenSizes.itemVertical.h;

  GoodNewsItem({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 뉴스 태그
        Row(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(_newsTagPadding, 0, _newsTagPadding, 0),
              decoration: const BoxDecoration(color: CustomColors.blue),
              child: SizedBox(
                height: _itemHeight,
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  child: Text(
                    "일정",
                    style: TextStyle(
                      color: CustomColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: _itemHorizontalSpace),
            Container(
              padding:
                  EdgeInsets.fromLTRB(_newsTagPadding, 0, _newsTagPadding, 0),
              decoration: const BoxDecoration(color: CustomColors.blue),
              child: SizedBox(
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  child: Text(
                    _parseToDday(news.targetingDate!),
                    style: const TextStyle(
                      color: CustomColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // 제목
        SizedBox(height: _itemVerticalSpace),
        Text(
          news.title,
          style: TextStyle(
            color: CustomColors.black,
            fontSize: _itemHeight,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: _itemVerticalSpace),
        Row(
          children: [
            Text(
              _parseToStringDate(news.postedDate!),
              style: TextStyle(
                color: CustomColors.black,
                fontSize: _itemHeight,
              ),
            ),
            Spacer(),
            Text(
              news.source,
              style: TextStyle(
                color: CustomColors.black,
                fontSize: _itemHeight,
              ),
            ),
          ],
        ),
      ],
    );

    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  CustomScreenSizes.goodNewsDdayBoxPaddingWidth.w,
                  0,
                  CustomScreenSizes.goodNewsDdayBoxPaddingWidth.w,
                  0),
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "일정",
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: CustomFontSizes.goodNewsDday.sp,
                ),
              ),
            ),
            SizedBox(
              width: CustomScreenSizes.newsTagHorizontal.w,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  CustomScreenSizes.goodNewsDdayBoxPaddingWidth.w,
                  0,
                  CustomScreenSizes.goodNewsDdayBoxPaddingWidth.w,
                  0),
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                _parseToDday(news.targetingDate!),
                style: TextStyle(
                  color: CustomColors.white,
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
              _parseToStringDate(news.targetingDate!),
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

  String _parseToDday(DateTime date) {
    int day = DateTime.now().difference(date).inDays;
    String np = "";

    if (day > 0) {
      np = "+";
    } else if (day == 0) {
      np = "-";
    }

    return "D" + np + day.toString();
  }
}
