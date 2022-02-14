import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/styles/custom_text_styles.dart';

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
              builder: (context) =>
                  DetailPage(market: coin.baseSymbol + '-' + coin.quoteSymbol)),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CorynSize.contextHorizontal),
        child: Row(
          children: [
            Row(
              children: [
                // _image(coin.logoUri),
                // SizedBox(
                //   width: CorynSize.contextHorizontal.w,
                // ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5,
                  child: _twoLineText(
                    coin.koreanName,
                    coin.baseSymbol + '/' + coin.quoteSymbol,
                    CrossAxisAlignment.start,
                  ),
                ),
                SizedBox(
                  width: CorynSize.contextHorizontal.w,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5,
                  child: _twoLineText(
                    coin.getFromattedPrice(coin.upbitPrice),
                    coin.getFromattedPrice(coin.binancePrice),
                    CrossAxisAlignment.end,
                  ),
                ),
                SizedBox(
                  width: CorynSize.contextHorizontal.w,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5,
                  child: _twoLineText(
                    coin.getScaledRate((coin.changeRate * 100)).toString(),
                    coin.getFromattedPrice(coin.changePrice),
                    CrossAxisAlignment.end,
                  ),
                ),
                SizedBox(
                  width: CorynSize.contextHorizontal.w,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5,
                  child: _twoLineText(
                    coin.getScaledRate(coin.kimpRate).toString(),
                    coin.getFromattedPrice(coin.kimpPrice),
                    CrossAxisAlignment.end,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(String uri) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(uri),
        ),
      ),
    );
  }

  Widget _twoLineText(String title, String subTitle, CrossAxisAlignment cross) {
    return Column(
      crossAxisAlignment: cross,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            style: CustomTextStyles.blackNormal,
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            subTitle,
            style: CustomTextStyles.greyNormal,
          ),
        )
      ],
    );
  }
}
