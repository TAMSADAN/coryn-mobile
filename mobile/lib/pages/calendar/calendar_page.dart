import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/calendar/components/calendar_body.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                backgroundColor: Colors.white,
                border: Border(),
                largeTitle: Text("캘린더"),
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 600,
                child: CalendarBody(),
              ),
            ],
          ),
        ));
  }
}
