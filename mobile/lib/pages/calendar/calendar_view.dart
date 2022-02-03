import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart';

class CoinCalendar extends StatelessWidget {
  const CoinCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CorynCalendarController>(
        builder: (_) => _.isLoading
            ? CupertinoActivityIndicator()
            : SfCalendar(
                view: CalendarView.month,
                headerDateFormat: 'yy.MM',
                headerStyle: CalendarHeaderStyle(
                    textStyle: CorynTextStyle.largeBoldTextStyle),
                dataSource: getCalendarDataSource(_.calendarList),
                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayCount: 3,
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                ),
                onTap: (calendarTapDetails) =>
                    calendarTapped(calendarTapDetails),
              ));
  }

  void calendarTapped(CalendarTapDetails details) {
    final _ = CorynCalendarModalController();
    List<String> marketList = [];
    for (var appoinment in details.appointments!) {
      marketList.add(appoinment.id);
    }
    _.updateCalendarModalList(marketList);
  }

  _DataSource getCalendarDataSource(calendarList) {
    final List<Appointment> appointments = <Appointment>[];
    Map<DateTime, String> _coinDateMap = {};

    for (var calendar in calendarList) {
      //  같은 날짜에 코인 1개만 표시
      if (_coinDateMap.containsKey(calendar.news.targetingDate)) {
        if (_coinDateMap[calendar.news.targetingDate] == calendar.market) {
          continue;
        }
      }

      if (calendar.news.newsType == "good") {
        appointments.add(Appointment(
          startTime: calendar.news.targetingDate!,
          endTime: calendar.news.targetingDate!,
          subject: calendar.market.split("-")[1],
          color: Colors.blueAccent,
          isAllDay: true,
          id: calendar.market,
        ));
        _coinDateMap[calendar.news.targetingDate!] = calendar.market;
      }
    }

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}
