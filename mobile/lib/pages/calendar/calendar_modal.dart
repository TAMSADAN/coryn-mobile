import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:mobile/utils/coryn_colors.dart';

class CoinCalendarModal extends StatelessWidget {
  const CoinCalendarModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CorynCalendarController>(
        builder: (_) => DraggableScrollableSheet(
            minChildSize: 0.3,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Material(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: ListView(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  children: [
                    _itemList(_.todayCalendarList),
                  ],
                ),
              );
            }));
  }

  Widget _itemList(List<Calendar> calendarList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CorynSize.pageHorizontal),
      child: Column(
        children: [
          SizedBox(
            height: CorynSize.componentVertical * 2.0,
          ),
          Container(
            width: 40,
            height: 2,
            color: CorynColors.defaultColor,
          ),
          SizedBox(
            height: CorynSize.componentVertical * 2.0,
          ),
          Text(
            "2021.02.01",
            style: CorynTextStyle.largeBoldTextStyle,
          ),
          SizedBox(
            height: CorynSize.componentVertical * 2.0,
          ),
          _item(),
          _item(),
        ],
      ),
    );
  }

  Widget _item() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent),
            ),
            SizedBox(
              width: CorynSize.contextHorizontal,
            ),
            Text(
              "비트코인 (BTC)",
              style: CorynTextStyle.largeBoldTextStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            children: [
              Text(
                "02/10 Bitcoin Snapshot !",
                style: CorynTextStyle.middleTextStyle,
              ),
              Text(
                "02/10 Bitcoin Snapshot !",
                style: CorynTextStyle.middleTextStyle,
              ),
              Text(
                "02/10 Bitcoin Snapshot !",
                style: CorynTextStyle.middleTextStyle,
              ),
              Text(
                "02/10 Bitcoin Snapshot !",
                style: CorynTextStyle.middleTextStyle,
              ),
              Text(
                "02/10 Bitcoin Snapshot !",
                style: CorynTextStyle.middleTextStyle,
              ),
              Text(
                "02/10 Bitcoin Snapshot !",
                style: CorynTextStyle.middleTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
