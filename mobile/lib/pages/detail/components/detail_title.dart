import 'package:flutter/material.dart';
import 'package:mobile/pages/components/coin/coin_image_box.dart';
import 'package:mobile/pages/components/coin/coin_information_summary_box.dart';
import 'package:mobile/pages/components/icon_forward.dart';
import 'package:mobile/models/summary.dart';
import 'package:mobile/models/detail.dart';

class DetailTitle extends StatelessWidget {
  final Detail detail;

  const DetailTitle({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CoinImageBox(detail.coin.logoUri),
            const SizedBox(width: 10),
            CoinInformationSummaryBox(
              coinKoreanName: detail.coin.koreanName,
              coinMarket: detail.coin.market,
              priceCurrency: detail.priceList[0].currency,
              priceOpeningPrice: detail.priceList[0].openingPrice,
            ),
          ],
        ),
      ],
    );
  }
}
