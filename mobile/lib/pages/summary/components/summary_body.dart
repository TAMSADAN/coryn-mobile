import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/pages/summary/components/summary_coin_item.dart';
import 'package:mobile/pages/components/list_cover.dart';
import 'package:mobile/pages/components/base_sub_title.dart';

class SummaryBody extends StatefulWidget {
  final List<Coin> coinList;

  const SummaryBody({Key? key, required this.coinList}) : super(key: key);

  @override
  _SummaryBodyState createState() => _SummaryBodyState();
}

class _SummaryBodyState extends State<SummaryBody> {
  late List<Coin> _coinList;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CupertinoSearchTextField(
            controller: _controller,
            onChanged: (value) => _onChangedController(value),
          ),
        ),
        BaseSubTitle("전체 코인"),
        ListCover(
          Column(children: [
            ...List.generate(_coinList.length, (index) {
              if (index < _coinList.length - 1) {
                return Column(
                  children: [
                    SummaryCoinListItem(coin: _coinList[index]),
                    Container(
                        padding: const EdgeInsets.only(left: 58),
                        child:
                            const Divider(color: Colors.black, thickness: 0.1)),
                  ],
                );
              } else {
                return SummaryCoinListItem(coin: _coinList[index]);
              }
            })
          ]),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _coinList = [];
    _coinList = [...widget.coinList];
  }

  void _onChangedController(String value) {
    List<Coin> _originCoinList = [...widget.coinList];
    List<Coin> _searchedCoinList = [];
    _searchedCoinList.clear();

    if (value == "") {
      _searchedCoinList = widget.coinList;
    }
    for (int i = 0; i < _originCoinList.length; i++) {
      //한글이름 체크
      // print(i);
      // print(value);
      // print(_originCoinList[i].koreanName);
      if (_originCoinList[i].koreanName.contains(value)) {
        _searchedCoinList.add(_originCoinList[i]);
      }
      //영어이름 체크 (대소문자 무시)
      else if (_originCoinList[i]
          .englishName
          .toUpperCase()
          .contains(value.toUpperCase())) {
        _searchedCoinList.add(_originCoinList[i]);
      }
      //마켓 체크 (대소문자 무시)
      else if (_originCoinList[i]
          .market
          .toUpperCase()
          .contains(value.toUpperCase())) {
        _searchedCoinList.add(_originCoinList[i]);
      }
    }
    setState(() {
      _coinList.clear();
      _coinList = [..._searchedCoinList];
    });
  }
}
