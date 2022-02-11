import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/components/coin_item.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';

class CoinList extends StatelessWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinListController>(
      builder: (_) => ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: _.coinList.map((_coin) {
          return CoinItem(coin: _coin);
        }).toList(),
      ),
    );
  }
}
