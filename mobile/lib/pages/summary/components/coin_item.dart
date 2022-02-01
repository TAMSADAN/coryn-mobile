import 'package:flutter/material.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({Key? key}) : super(key: key);

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
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueAccent),
              ),
              SizedBox(width: CorynSize.contextHorizontal),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "비트코인",
                    style: CorynTextStyle.largeBoldTextStyle,
                  ),
                  Text(
                    "56,124,558",
                    style: CorynTextStyle.smallTextStyle,
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Text("+10.5%", style: CorynTextStyle.rateUpTextStyle),
            ),
          )
        ],
      ),
    );
  }
}
