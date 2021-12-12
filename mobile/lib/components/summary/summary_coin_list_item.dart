import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/detail_page.dart';
import 'package:mobile/components/share/coin_image_box.dart';
import 'package:mobile/components/share/coin_price_rate_box.dart';
import 'package:mobile/components/share/coin_information_summary_box.dart';
import 'package:mobile/components/share/icon_forward.dart';

class SummaryCoinListItem extends StatelessWidget {
  final String coinImagePath;
  final String coinName;
  final String coinExchange;
  final String coinPrice;
  final String coinPriceRate;

  const SummaryCoinListItem(this.coinImagePath, this.coinName,
      this.coinExchange, this.coinPrice, this.coinPriceRate);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPage()),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CoinImageBox(coinImagePath),
          const SizedBox(width: 8),
          Expanded(
              child:
                  CoinInformationSummaryBox(coinName, coinExchange, coinPrice)),
          const SizedBox(width: 15),
          Row(
            children: [
              CoinPriceRateBox(coinPriceRate),
              IconForward(key: key),
            ],
          ),
        ],
      ),
    );
  }
}
