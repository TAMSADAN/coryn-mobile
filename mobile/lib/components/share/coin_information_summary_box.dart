import 'package:flutter/material.dart';

class CoinInformationSummaryBox extends StatelessWidget {
  final String coinName;
  final String coinExchange;
  final String coinPrice;

  const CoinInformationSummaryBox(
      this.coinName, this.coinExchange, this.coinPrice);

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
              coinExchange,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Text(
          coinPrice,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    );
  }
}
