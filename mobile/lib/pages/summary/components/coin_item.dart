import 'package:mobile/models/dto/coin.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;

  const CoinItem({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    coin.price.openingPrice.toString(),
                    style: CorynTextStyle.smallTextStyle,
                  )
                ],
              ),
            ],
          ),
          if (coin.price.changeRate > 0)
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                    "+" + coin.price.changeRate.toStringAsFixed(3) + '%',
                    style: CorynTextStyle.rateUpTextStyle),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                    "-" +
                        (coin.price.changeRate.abs()).toStringAsFixed(3) +
                        '%',
                    style: CorynTextStyle.rateUpTextStyle),
              ),
            )
        ],
      ),
    );
  }
}
