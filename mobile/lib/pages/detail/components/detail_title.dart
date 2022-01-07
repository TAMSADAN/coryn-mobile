import 'package:flutter/material.dart';
import 'package:mobile/pages/components/coin/coin_image_box.dart';
import 'package:mobile/pages/components/coin/coin_information_summary_box.dart';
import 'package:mobile/pages/components/icon_forward.dart';
import 'package:mobile/models/summary.dart';
import 'package:mobile/models/detail.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/price.dart';

class DetailTitle extends StatelessWidget {
  final Coin coin;

  const DetailTitle({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CoinImageBox(coin.logoUri),
            const SizedBox(width: 10),
            CoinInformationSummaryBox(
              coinKoreanName: coin.koreanName,
              coinMarket: coin.market,
              priceCurrency: coin.price.currency,
              priceOpeningPrice: coin.price.openingPrice,
            ),
          ],
        ),
      ],
    );
  }
}
