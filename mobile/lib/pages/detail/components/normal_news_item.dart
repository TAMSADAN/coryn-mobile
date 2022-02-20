import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class NormalNewsItem extends StatelessWidget {
  final News news;

  final double _itemHeight = CustomScreenSizes.itemHeight.h;
  final double _newsTagPadding = CustomScreenSizes.newsTagPadding.w;
  final double _itemVerticalSpace = CustomScreenSizes.itemVertical.h;

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
          child: SizedBox(
            height: _itemHeight,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              child: Text(
                "구글 뉴스",
                style: TextStyle(
                  color: CustomColors.black,
                ),
              ),
            ),
          ),
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
  }

  String _parseToStringDate(DateTime date) {
    String stringDate = "";

    stringDate += date.year.toString().replaceRange(0, 2, "") + "년";
    stringDate += date.month.toString().padLeft(2, '0') + "월";
    stringDate += date.day.toString().padLeft(2, '0') + '일';

    return stringDate;
  }
}
