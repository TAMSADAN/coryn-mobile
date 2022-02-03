import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart';
import 'package:mobile/pages/calendar/calendar_view.dart';
import 'package:mobile/pages/calendar/calendar_modal.dart';
import 'package:mobile/pages/ad_banner.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _corynController = Get.put(CorynCalendarController());

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // 캘린더
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    CorynSize.calendarPageHorizontal,
                    CorynSize.pageVertical,
                    CorynSize.calendarPageHorizontal,
                    0.0,
                  ),
                  child: CoinCalendar(),
                ),
              ),
              AdBanner(),
            ],
          ),
          CoinCalendarModal()
        ],
      ),
    );
  }
}
