import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/summary/summary_search.dart';
import 'package:mobile/pages/summary/summary_coin_list_item.dart';
import 'package:mobile/pages/list_cover.dart';
import 'package:mobile/models/summary.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  List<Summary> _originSummaryList = [];
  List<Summary> _editedSummaryList = [];
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f6),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: const Color(0xfff2f2f6),
              border: Border(),
              largeTitle: Text("홈"),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            //검색바
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CupertinoSearchTextField(
                controller: _controller,
                onChanged: (value) => _onChangedController(value),
              ),
            ),
            BaseSubTitle("전체 코인"),
            ListCover(
              Column(
                  children: List.generate(_editedSummaryList.length, (index) {
                if (index < _editedSummaryList.length - 1)
                  return Column(
                    children: [
                      SummaryCoinListItem(
                        summary: _editedSummaryList[index],
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 58),
                          child: Divider(color: Colors.black, thickness: 0.1)),
                    ],
                  );
                else
                  return SummaryCoinListItem(
                    summary: _editedSummaryList[index],
                  );
              })),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editedSummaryList = [...dummySummaryList];
    _originSummaryList = [...dummySummaryList];
    print(_editedSummaryList);
    print(_originSummaryList);
  }

  void _onChangedController(String value) {
    print(value);
    setState(() {
      print(_editedSummaryList);
      print(_originSummaryList);
      _editedSummaryList.clear();
      for (var summary in _originSummaryList) {
        print(summary.coin.koreanName);
        //한글이름 체크
        if (summary.coin.koreanName.contains(value)) {
          _editedSummaryList.add(summary);
        }
        //영어이름 체크 (대소문자 무시)
        else if (summary.coin.englishName
            .toUpperCase()
            .contains(value.toUpperCase())) {
          _editedSummaryList.add(summary);
        }
        //마켓 체크 (대소문자 무시)
        else if (summary.coin.market
            .toUpperCase()
            .contains(value.toUpperCase())) {
          _editedSummaryList.add(summary);
        }
        print(_editedSummaryList);
      }
    });
  }
}

// class SummaryPage extends StatelessWidget {
//   const SummaryPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff2f2f6),
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
//           return <Widget>[
//             CupertinoSliverNavigationBar(
//               backgroundColor: const Color(0xfff2f2f6),
//               border: Border(),
//               largeTitle: Text("홈"),
//             ),
//           ];
//         },
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: SummarySearch(),
//             ),
//             BaseSubTitle("전체 코인"),
//             ListCover(
//               Column(
//                   children: List.generate(summaryList.length, (index) {
//                 if (index < summaryList.length - 1)
//                   return Column(
//                     children: [
//                       SummaryCoinListItem(
//                         summary: summaryList[index],
//                       ),
//                       Container(
//                           padding: const EdgeInsets.only(left: 58),
//                           child: Divider(color: Colors.black, thickness: 0.1)),
//                     ],
//                   );
//                 else
//                   return SummaryCoinListItem(
//                     summary: summaryList[index],
//                   );
//               })),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
