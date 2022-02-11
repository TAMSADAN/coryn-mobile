import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';

class CoinInfo extends StatelessWidget {
  const CoinInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => _.fetchingCoin
          ? const CupertinoActivityIndicator()
          : Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey[50],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(_.coin.logoUri),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: CorynSize.contextHorizontal),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _.coin.koreanName,
                          style: CorynTextStyle.largeBoldTextStyle,
                        ),
                        Text(
                          _.coin.market.split('-')[1],
                          style: CorynTextStyle.smallTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        _.coin.getCoinPrice(),
                        style: CorynTextStyle.largeBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
