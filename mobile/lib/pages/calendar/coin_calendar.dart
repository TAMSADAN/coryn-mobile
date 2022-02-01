import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/utils/coryn_text_style.dart';

class CoinCalendar extends StatelessWidget {
  final List<Calendar> calenderList;

  const CoinCalendar({Key? key, required this.calenderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      headerDateFormat: 'yy.MM',
      headerStyle:
          CalendarHeaderStyle(textStyle: CorynTextStyle.largeBoldTextStyle),
      dataSource: getCalendarDataSource(),
      monthViewSettings: const MonthViewSettings(
        appointmentDisplayCount: 3,
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
      onTap: (calendarTapDetails) =>
          calendarTapped(calendarTapDetails, context),
    );
  }

  void calendarTapped(CalendarTapDetails details, BuildContext context) {
    print(details.appointments);
    if (details.targetElement == CalendarElement.appointment) {
      final Appointment appointmentDetails = details.appointments![0];
      final String _market = appointmentDetails.id as String;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailPage(market: _market, defaultOption: 1)),
      );
    }
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    Map<DateTime, String> _coinDateMap = {};

    for (var calendar in calenderList) {
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
