import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/styles/custom_font_sizes.dart';
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
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                ),
                onTap: (calendarTapDetails) {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _calendarModal(
                          _.newsList, calendarTapDetails.appointments ?? []);
                    },
                  );
                },
              ));
  }

  Widget _calendarModal(List<News> newsList, List<dynamic> appointmentList) {
    List<Widget> itemList = [];
    for (Appointment appointment in appointmentList) {
      itemList.add(Text(
        appointment.subject,
        style: CustomFontSizes.title.sp,
      ));
    }

    return Column(
      children: itemList,
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
