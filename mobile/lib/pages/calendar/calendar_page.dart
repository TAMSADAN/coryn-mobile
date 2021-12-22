import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/calendar/components/calendar_body.dart';
import 'package:mobile/models/calendar.dart';

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
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 600,
                child: CalendarBody(calenderList: _calendarList),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarList = dummyCalendarList;
  }
}

// class CalendarPage extends StatelessWidget {
//   const CalendarPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
//             return <Widget>[
//               CupertinoSliverNavigationBar(
//                 backgroundColor: Colors.white,
//                 border: Border(),
//                 largeTitle: Text("캘린더"),
//               ),
//             ];
//           },
//           body: ListView(
//             shrinkWrap: true,
//             children: [
//               SizedBox(
//                 height: 600,
//                 child: CalendarBody(calenderList: dummyCalendarList),
//               ),
//             ],
//           ),
//         ));
//   }
// }
