import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/calendar.dart';

class CalendarBody extends StatelessWidget {
  final List<Calendar> calenderList;

  const CalendarBody({Key? key, required this.calenderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      headerStyle: CalendarHeaderStyle(textStyle: TextStyle(fontSize: 20)),
      dataSource: getCalendarDataSource(),
      monthViewSettings: const MonthViewSettings(
        showAgenda: true,
        agendaViewHeight: 100,
        agendaItemHeight: 30,
        // agendaStyle: AgendaStyle(appointmentTextStyle: TextStyle(fontSize: 0)),
        appointmentDisplayCount: 4,
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
      onTap: (calendarTapDetails) =>
          calendarTapped(calendarTapDetails, context),
    );
  }

  void calendarTapped(CalendarTapDetails details, BuildContext context) {
    if (details.targetElement == CalendarElement.appointment) {
      final Appointment appointmentDetails = details.appointments![0];
      final Coin _coin = appointmentDetails.id as Coin;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(coin: _coin, defaultOption: 1)),
      );
    }
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    Map<DateTime, Coin> _coinDateMap = {};

    for (var calendar in calenderList) {
      //  같은 날짜에 코인 1개만 표시
      if (_coinDateMap.containsKey(calendar.news.targetingDate)) {
        if (_coinDateMap[calendar.news.targetingDate]!.market ==
            calendar.coin.market) {
          continue;
        }
      }

      if (calendar.news.newsType == "good") {
        appointments.add(Appointment(
          startTime: calendar.news.targetingDate!,
          endTime: calendar.news.targetingDate!,
          subject: calendar.coin.market,
          color: Colors.blueAccent,
          isAllDay: true,
          id: calendar.coin,
        ));
        _coinDateMap[calendar.news.targetingDate!] = calendar.coin;
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

class _CoinDate {
  Coin coin;
  DateTime date;

  _CoinDate({
    required this.coin,
    required this.date,
  });
}
