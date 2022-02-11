import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart';
import 'package:mobile/styles/custom_text_styles.dart';

class CoinCalendar extends StatelessWidget {
  const CoinCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CorynCalendarController>(
        builder: (_) => _.isLoading
            ? const CupertinoActivityIndicator()
            : SfCalendar(
                view: CalendarView.month,
                headerDateFormat: 'yy.MM',
                headerStyle: const CalendarHeaderStyle(
                    textStyle: CustomTextStyles.largeBold),
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
    final _ = Get.find<CorynCalendarModalController>();
    List<String> marketList = [];
    for (var appoinment in details.appointments!) {
      marketList.add(appoinment.id);
    }
    _.updateClick();
    _.updateToday(details.date!);
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
