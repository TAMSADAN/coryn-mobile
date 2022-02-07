import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/models/calendar_modal.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:mobile/utils/coryn_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CoinCalendarModal extends StatelessWidget {
  const CoinCalendarModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CorynCalendarModalController>(
        builder: (_) => DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3.5,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  children: [
                    _.isLoading
                        ? CupertinoActivityIndicator()
                        : _itemList(_.today, _.calendarModalList, context)
                  ],
                ),
              );
            }));
  }

  Widget _itemList(DateTime today, List<CalendarModal> calendarModalList,
      BuildContext context) {
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
            today.year.toString().replaceRange(0, 2, "") +
                "." +
                today.month.toString().padLeft(2, '0') +
                "." +
                today.day.toString().padLeft(2, '0'),
            style: CorynTextStyle.largeBoldTextStyle,
          ),
          SizedBox(
            height: CorynSize.componentVertical * 2.0,
          ),
          if (calendarModalList.length == 0)
            Center(
                child: Text(
              "일정이 없습니다.",
              style: CorynTextStyle.largeTextStyle,
            )),
          ...calendarModalList.map((_calendarModal) {
            return _item(_calendarModal, context);
          }).toList(),
        ],
      ),
    );
  }

  Widget _item(CalendarModal calendarModal, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(market: calendarModal.coin.market)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.grey[50],
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(calendarModal.coin.logoUri),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: CorynSize.contextHorizontal,
              ),
              Text(
                calendarModal.coin.koreanName +
                    "(" +
                    calendarModal.coin.market.split("-")[1] +
                    ")",
                style: CorynTextStyle.largeBoldTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: calendarModal.newsList.map((news) {
              return GestureDetector(
                onTap: () => _launchURL(news.url),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    news.targetingDate!.month.toString().padLeft(2, '0') +
                        "/" +
                        news.targetingDate!.day.toString().padLeft(2, '0') +
                        " " +
                        news.title,
                    style: CorynTextStyle.middleTextStyle,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: CorynSize.contextVertical * 2.0),
      ],
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
