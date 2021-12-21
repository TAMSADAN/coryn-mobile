import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/models/config/news.dart';

class CalendarBody extends StatelessWidget {
  final List<News> newsList;

  const CalendarBody({Key? key, required this.newsList}) : super(key: key);

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
      final _subject = appointmentDetails.subject;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DetailPage()),
      );
    }
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    this.newsList.forEach((news) {
      if (news.sourceName == "good") {
        appointments.add(Appointment(
          startTime: news.targetDate,
          endTime: news.targetDate,
          subject: news.title,
          color: Colors.blueAccent,
          isAllDay: true,
        ));
      }
    });

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}
