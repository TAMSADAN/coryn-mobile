import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/calendar/components/calendar_body.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/models/calendar_model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _calendarModel = CalendarModel();

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
                heroTag: "calendar",
              ),
            ];
          },
          body: Column(
            children: [
              // 캘린더
              Expanded(
                child: FutureBuilder(
                    future: _calendarModel.fetchCalendar(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Center(child: CupertinoActivityIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: 700,
                              child: CalendarBody(calenderList: snapshot.data),
                            ),
                          ],
                        );
                      }
                    }),
              ),
              // 배너 광고
              AdBanner(),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
