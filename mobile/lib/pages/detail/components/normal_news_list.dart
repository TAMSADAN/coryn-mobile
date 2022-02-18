import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/detail/components/normal_news_item.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';

class NormalNewsList extends StatelessWidget {
  const NormalNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Column(
        children: _.normalNewsList.map((_news) {
          return Column(
            children: [
              NormalNewsItem(news: _news),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
