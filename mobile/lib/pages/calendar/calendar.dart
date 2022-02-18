import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/detail/components/good_news_item.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';
import 'package:mobile/utils/secrets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart'
    as coryn;
import 'package:mobile/styles/custom_text_styles.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<coryn.CalendarController>(
      builder: (_) => _.isLoading
          ? const CupertinoActivityIndicator()
          : SfCalendar(
              view: CalendarView.month,
              headerDateFormat: 'yy.MM',
              headerStyle: const CalendarHeaderStyle(
                  textStyle: CustomTextStyles.largeBold),
              dataSource: getCalendarDataSource(_.newsList),
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayCount: 3,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
              onTap: (calendarTapDetails) {
                _.updateToday(calendarTapDetails.date!);
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _calendarModal(
                        _.newsList,
                        calendarTapDetails.appointments ?? [],
                        _.today,
                        context);
                  },
                );
              },
            ),
    );
  }

  Widget _calendarModal(List<News> newsList, List<dynamic> appointmentList,
      DateTime today, BuildContext context) {
    final _coinListController = Get.find<CoinListController>();

    double modalHeight = CustomScreenSizes.calendarModalVertical.h;
    double headerHeight = CustomScreenSizes.calendarModalHeaderVertical.h;
    double headerPaddingHeight =
        CustomScreenSizes.calendarModalHeaderPaddingHeight.h;
    double itemListHeight =
        modalHeight - headerHeight - headerPaddingHeight * 2;

    Widget modalHeader = Padding(
      padding: EdgeInsets.symmetric(vertical: headerPaddingHeight),
      child: SizedBox(
        height: headerHeight,
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            today.year.toString().replaceRange(0, 2, "") +
                "년 " +
                today.month.toString().padLeft(2, '0') +
                "월 " +
                today.day.toString().padLeft(2, '0') +
                '일',
            style: TextStyle(
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    List<Widget> itemList = [];
    for (Appointment appointment in appointmentList) {
      bool _isCoinList = false;
      List<Widget> _coinList =
          _coinListController.coinData.entries.map((entry) {
        List<Widget> _itemList = [];
        for (Coin _coin in entry.value) {
          if (_coin.base == appointment.subject) {
            _isCoinList = true;
            _itemList.add(Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(coin: _coin)),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: CustomFontSizes.calendarModalItemHeader.sp,
                          height: CustomFontSizes.calendarModalItemHeader.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage(
                                  Secrets.platformImageData[entry.key]!),
                            ),
                          ),
                        ),
                        Text(
                          _coin.base + "-" + _coin.target,
                          style: TextStyle(
                              color: CustomColors.black,
                              fontSize: CustomFontSizes.calendarModealItem.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
          }
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _itemList
              .map((e) => Row(children: [
                    e,
                    VerticalDivider(),
                  ]))
              .toList(),
        );
      }).toList();

      itemList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: CustomFontSizes.calendarModalItemHeader.sp,
                  height: CustomFontSizes.calendarModalItemHeader.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cryptoicon-api.vercel.app/api/icon/${appointment.subject.toLowerCase()}"),
                    ),
                  ),
                ),
                SizedBox(
                    width:
                        CustomScreenSizes.calendarModalItemHeaderHorizontal.w),
                Text(
                  appointment.subject,
                  style: TextStyle(
                    fontSize: CustomFontSizes.calendarModalItemHeader.sp,
                    color: CustomColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (_isCoinList)
              Column(children: [
                SizedBox(
                  height: CustomScreenSizes.calendarModalItemVertical.h,
                ),
                SizedBox(
                  height: CustomScreenSizes
                      .calendarModalItemHorizontalListViewHeight.h,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: _coinList),
                ),
              ]),
            Padding(
              padding:
                  EdgeInsets.only(top: CustomScreenSizes.newsItemVertical.h),
              child: Column(
                children: newsList
                    .where((_news) => _news.base == appointment.subject)
                    .map((news) {
                  return Column(
                    children: [
                      GoodNewsItem(news: news),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: CustomScreenSizes.calendarModalVertical.h,
      child: Column(
        children: [
          modalHeader,
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: CustomScreenSizes.calendarModalPaddingWidth.w),
            height: itemListHeight,
            child: ListView(
              shrinkWrap: true,
              children: itemList,
            ),
          ),
        ],
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    print("hello");
    // List<String> marketList = [];
    // for (var appoinment in details.appointments!) {
    //   marketList.add(appoinment.id);
    // }
    // _.updateClick();
    // _.updateToday(details.date!);
    // _.updateCalendarModalList(marketList);
  }

  _DataSource getCalendarDataSource(List<News> newsList) {
    final List<Appointment> appointmentList = <Appointment>[];
    Map<DateTime, String> _coinDateMap = {};

    for (News _news in newsList) {
      if (appointmentList.firstWhereOrNull((_item) => _item.id == _news.base) !=
          null) {
        continue;
      } else {
        appointmentList.add(
          Appointment(
            startTime: _news.targetingDate!,
            endTime: _news.targetingDate!,
            subject: _news.base,
            color: Colors.blueAccent,
            isAllDay: true,
            id: _news.base,
          ),
        );
      }
    }

    return _DataSource(appointmentList);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}
