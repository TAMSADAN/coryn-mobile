import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/styles/custom_text_styles.dart';
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
                    _getFromattedPrice(coin.upbitPrice),
                    _getFromattedPrice(coin.binancePrice),
                    CrossAxisAlignment.end,
                  ),
                ),
                SizedBox(
                  width: CorynSize.contextHorizontal.w,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5,
                  child: _textRateAndPrice(
                    coin.changeRate * 100,
                    coin.changePrice,
                  ),
                ),
                SizedBox(
                  width: CorynSize.contextHorizontal.w,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5,
                  child: _textRateAndPrice(
                    coin.kimpRate,
                    coin.kimpPrice,
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

  Widget _textRateAndPrice(double rate, double price) {
    final TextStyle rateTextStyle =
        rate > 0 ? CustomTextStyles.rateUp : CustomTextStyles.rateDown;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _getFormattedRate(rate),
            style: rateTextStyle,
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _getFromattedPrice(price),
            style: CustomTextStyles.greyNormal,
          ),
        )
      ],
    );
  }

  String _getFromattedPrice(double price) {
    String formattedPrice;
    var f = NumberFormat('###,###,###,###');

    if (price < 100) {
      formattedPrice = double.parse(price.toStringAsFixed(2)).toString();
    } else {
      formattedPrice = f.format(price.round()).toString();
    }

    return formattedPrice;
  }

  double _getScaledPrice(double price) {
    double scaledPrice = price;

    if (price < 100) {
      scaledPrice = double.parse(price.toStringAsFixed(2));
    }

    return scaledPrice;
  }

  String _getFormattedRate(double rate) {
    String doubleRate;

    doubleRate = (rate > 0 ? "+" : "") +
        double.parse(rate.toStringAsFixed(2)).toString();

    return doubleRate;
  }
}
