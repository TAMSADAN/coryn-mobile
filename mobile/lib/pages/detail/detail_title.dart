import 'package:flutter/material.dart';
import 'package:mobile/pages/components/coin/coin_image_box.dart';
import 'package:mobile/pages/components/coin/coin_information_summary_box.dart';
import 'package:mobile/pages/components/icon_forward.dart';

class DetailTitle extends StatelessWidget {
  final String coinImagePath;
  final String coinName;
  final String coinExchange;
  final String coinPrice;

  // ignore: use_key_in_widget_constructors
  const DetailTitle(
      this.coinImagePath, this.coinName, this.coinExchange, this.coinPrice);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CoinImageBox(coinImagePath),
            const SizedBox(width: 10),
            CoinInformationSummaryBox(coinName, coinExchange, coinPrice),
          ],
        ),
        const IconForward(),
      ],
    );
  }
}
