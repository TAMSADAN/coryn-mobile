import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/calendar/components/calendar_body.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/ad_banner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late List<Calendar> _calendarList;

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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 700,
                      child: CalendarBody(calenderList: _calendarList),
                    ),
                  ],
                ),
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
    _calendarList = [];
    fetchCalendar();
  }

  Future<bool> fetchCalendar() async {
    List<Calendar>? calendarList = [];
    final queryParameters = {
      "type": "good",
    };
    final response = await http
        .get(Uri.http("13.125.161.94:8080", "/api/v1/news", queryParameters));

    if (response.statusCode == 200) {
      for (var newsJson in json.decode(utf8.decode(response.bodyBytes))) {
        var news = News.fromJson(newsJson);
        List<String>? symbolList = [];
        for (var market in news.marketList) {
          var symbol = market.toString().split("-")[1];
          if (!symbolList.contains(symbol)) {
            symbolList.add(symbol);
            calendarList.add(Calendar(market: market, news: news));
          }
        }
      }
      setState(() {
        _calendarList.clear();
        _calendarList.addAll([...calendarList]);
      });
      return true;
    } else {
      return false;
    }
  }
}
