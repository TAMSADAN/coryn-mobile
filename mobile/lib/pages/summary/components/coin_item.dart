import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/styles/custom_colors.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';
import 'package:mobile/styles/custom_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:mobile/utils/secrets.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;
  final String platform;
  final String target;

  const CoinItem(
      {Key? key,
      required this.coin,
      required this.platform,
      required this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(coin: coin)),
        );
      },
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: ScreenUtil().screenWidth / 30,
                height: ScreenUtil().screenWidth / 30,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://cryptoicon-api.vercel.app/api/icon/${coin.base.toLowerCase()}"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: CustomScreenSizes.coinListItemImagePaddingHeight.h,
              ),
              Center(
                child: Icon(
                  CupertinoIcons.star,
                  size: ScreenUtil().screenWidth / 30,
                ),
              ),
            ],
          ),
          SizedBox(width: CustomScreenSizes.coinListItemImageHorizontal.w),
          SizedBox(
            width: ScreenUtil().screenWidth / 5.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    coin.base + '/' + coin.target,
                    style: CustomTextStyles.blackNormal,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    Secrets.platformData[coin.platform]! +
                        ' (' +
                        coin.platform +
                        ')',
                    style: CustomTextStyles.greyNormal,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: ScreenUtil().screenWidth / 5.5,
            child: _twoLineText(
              _getFromattedPrice(coin.tradePrice),
              _getFromattedPrice(coin.volume),
              CrossAxisAlignment.end,
            ),
          ),
          SizedBox(
            width: CustomScreenSizes.coinListItemPaddingWidth.w,
          ),
          SizedBox(
            width: ScreenUtil().screenWidth / 5.5,
            child: _textRateAndPrice(
              coin.changeRate,
              coin.changePrice,
            ),
          ),
          if (platform != "BINANCE" && target == "KRW")
            Row(
              children: [
                SizedBox(
                  width: CustomScreenSizes.coinListItemPaddingWidth.w,
                ),
                SizedBox(
                  width: ScreenUtil().screenWidth / 5.5,
                  child: _textRateAndPrice(
                    coin.premiumRate,
                    coin.premiumPrice,
                  ),
                ),
              ],
            ),
        ],
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

  Widget _textRateAndPrice(double? rate, double? price) {
    final Color _textColor = rate == null
        ? CustomColors.black
        : rate > 0
            ? CustomColors.rateUp
            : CustomColors.rateDown;

    final _rateText = rate == null ? " " : _getFormattedRate(rate) + "%";
    final _priceText = price == null ? " " : _getFormattedRatePrice(price);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _rateText,
            style: TextStyle(color: _textColor),
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _priceText,
            style: TextStyle(
              color: CustomColors.grey,
            ),
          ),
        )
      ],
    );
  }

  String _getFromattedPrice(double price) {
    String formattedPrice;
    var f = NumberFormat('###,###,###,###');

    if (price < 100) {
      formattedPrice = price.toString();
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

  String _getFormattedRatePrice(double ratePrice) {
    String formattedPrice = "";
    var f = NumberFormat('###,###,###,###');

    if (ratePrice > 0) {
      formattedPrice += '+';
    }
    if (ratePrice.abs() < 1) {
      formattedPrice += double.parse(ratePrice.toStringAsFixed(2)).toString();
    } else {
      formattedPrice = f.format(ratePrice.round()).toString();
    }
    return formattedPrice;
  }
}
