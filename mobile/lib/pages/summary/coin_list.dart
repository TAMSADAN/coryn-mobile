import 'package:flutter/material.dart';
import 'package:mobile/pages/summary/components/coin_item.dart';

class CoinList extends StatelessWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
        CoinItem(),
      ],
    );
  }
}
