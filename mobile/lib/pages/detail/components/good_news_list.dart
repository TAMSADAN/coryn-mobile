import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/detail/components/good_news_item.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class GoodNewsList extends StatelessWidget {
  const GoodNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Column(
        children: _.goodNewsList.map((_news) {
          return Padding(
            padding: EdgeInsets.only(bottom: CustomScreenSizes.newsVertical.h),
            child: GoodNewsItem(news: _news),
          );
        }).toList(),
      ),
    );
  }
}
