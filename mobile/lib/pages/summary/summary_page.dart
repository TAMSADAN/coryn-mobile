import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/summary/components/summary_search.dart';
import 'package:mobile/pages/summary/components/summary_coin_list_item.dart';
import 'package:mobile/pages/list_cover.dart';
import 'package:mobile/models/summary.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/pages/ad_banner.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late List<Summary> _originSummaryList;
  late List<Summary> _editedSummaryList;
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
              heroTag: "home",
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: ListView(
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
                  // 코인 리스트
                  ListCover(
                    Column(
                        children:
                            List.generate(_editedSummaryList.length, (index) {
                      if (index < _editedSummaryList.length - 1)
                        return Column(
                          children: [
                            SummaryCoinListItem(
                              summary: _editedSummaryList[index],
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 58),
                                child: Divider(
                                    color: Colors.black, thickness: 0.1)),
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
            // 배너 광고
            AdBanner()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchSummary();
    _editedSummaryList = [];
    _originSummaryList = [];
  }

  void _onChangedController(String value) {
    setState(() {
      _editedSummaryList.clear();
      for (var summary in _originSummaryList) {
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
      }
    });
  }

  Future<bool> fetchSummary() async {
    List<Summary>? summaryList = [];
    final response =
        await http.get(Uri.http("13.125.161.94:8080", "/api/v1/coins"));
    // print(json.decode(response.body));

    if (response.statusCode == 200) {
      for (var summaryJson in json.decode(utf8.decode(response.bodyBytes))) {
        var summary = Summary.fromJson(summaryJson);
        if (summary.coin.market.contains("KRW")) summaryList.add(summary);
      }
      setState(() {
        _originSummaryList.clear();
        _originSummaryList.addAll([...summaryList]);
        _editedSummaryList.clear();
        _editedSummaryList.addAll([...summaryList]);
      });
      return true;
    } else {
      return false;
    }
  }
}
