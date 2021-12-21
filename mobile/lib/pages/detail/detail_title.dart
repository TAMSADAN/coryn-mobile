import 'package:flutter/material.dart';
import 'package:mobile/pages/components/coin/coin_image_box.dart';
import 'package:mobile/pages/components/coin/coin_information_summary_box.dart';
import 'package:mobile/pages/components/icon_forward.dart';
import 'package:mobile/models/summary.dart';

class DetailTitle extends StatelessWidget {
  final Summary summary;
  // final String coinName;
  // final double coinPrice;
  // final String coinTicker;
  // final String coinMarket;

  const DetailTitle({Key? key, required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CoinImageBox(summary.coinImageUri),
            const SizedBox(width: 10),
            CoinInformationSummaryBox(summary.coinName, summary.coinPrice,
                summary.coinTicker, summary.coinMarket),
          ],
        ),
      ],
    );
  }
}
