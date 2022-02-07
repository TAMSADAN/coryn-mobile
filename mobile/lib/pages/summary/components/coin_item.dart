import 'package:mobile/models/dto/coin.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:intl/intl.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;

  const CoinItem({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(market: coin.market)),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CorynSize.contextHorizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.grey[50],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(coin.logoUri),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: CorynSize.contextHorizontal),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coin.koreanName,
                      style: CorynTextStyle.largeBoldTextStyle,
                    ),
                    Text(
                      coin.getCoinPrice(),
                      style: CorynTextStyle.smallTextStyle,
                    )
                  ],
                ),
              ],
            ),
            if (coin.price.changeRate > 0)
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                  child: Text(
                      (coin.price.changeRate * 100).toStringAsFixed(2) + '%',
                      style: CorynTextStyle.rateUpTextStyle),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                  child: Text(
                      (coin.price.changeRate.abs() * 100).toStringAsFixed(2) +
                          '%',
                      style: CorynTextStyle.rateDownTextStyle),
                ),
              )
          ],
        ),
      ),
    );
  }
}
