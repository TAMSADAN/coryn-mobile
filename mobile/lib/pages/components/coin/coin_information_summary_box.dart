import 'package:flutter/material.dart';

class CoinInformationSummaryBox extends StatelessWidget {
  final String coinKoreanName;
  final String coinMarket;
  final String priceCurrency;
  final double priceOpeningPrice;

  const CoinInformationSummaryBox(
      {Key? key,
      required this.coinKoreanName,
      required this.coinMarket,
      required this.priceCurrency,
      required this.priceOpeningPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              coinKoreanName,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Text(
              "$coinMarket/$priceCurrency",
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
        Text(
          priceOpeningPrice.toString(),
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    );
  }
}
