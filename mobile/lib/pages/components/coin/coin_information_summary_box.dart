import 'package:flutter/material.dart';

class CoinInformationSummaryBox extends StatelessWidget {
  final String coinName;
  final double coinPrice;
  final String coinTicker;
  final String coinMarket;

  const CoinInformationSummaryBox(
      this.coinName, this.coinPrice, this.coinTicker, this.coinMarket);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              coinName,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Text(
              "$coinTicker/$coinMarket",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Text(
          coinPrice.toString(),
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    );
  }
}
