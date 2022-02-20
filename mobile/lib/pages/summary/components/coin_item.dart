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
import 'package:mobile/utils/helpers.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;
  final String platform;
  final String target;

  final double _itemWidth = ScreenUtil().screenWidth / 5.0;
  final double _itemHeight = CustomScreenSizes.itemHeight.h;
  final double _itemHorizontalSpace = CustomScreenSizes.itemHorizontal.w;
  final double _itemImageHorizontalSpace =
      CustomScreenSizes.itemHorizontal.w / 2.0;
  final double _itemVerticalSpace = CustomScreenSizes.itemVertical.h;

  CoinItem(
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
          // 로고 & 아이콘
          Column(
            children: [
              SizedBox(
                width: _itemHeight,
                height: _itemHeight,
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
              SizedBox(height: _itemVerticalSpace),
              Icon(
                CupertinoIcons.star,
                size: _itemHeight,
              ),
            ],
          ),
          SizedBox(width: _itemImageHorizontalSpace),
          // 코인
          Column(
            children: [
              SizedBox(
                width: _itemWidth,
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        coin.base + '/' + coin.target,
                        style: CustomTextStyles.blackNormal,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: _itemVerticalSpace),
              SizedBox(
                width: _itemWidth,
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    coin.koreanName ??
                        Secrets.platformData[coin.platform]! +
                            ' (' +
                            coin.platform +
                            ')',
                    style: CustomTextStyles.greyNormal,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          // 현재가
          Column(
            children: [
              SizedBox(
                width: _itemWidth,
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                  child: _textTitlePrice(coin.tradePrice),
                ),
              ),
              SizedBox(height: _itemVerticalSpace),
              SizedBox(
                width: _itemWidth,
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                  child: _textSubPrice(coin.volume),
                ),
              ),
            ],
          ),
          SizedBox(width: _itemHorizontalSpace),
          // 전일 대비
          Column(
            children: [
              SizedBox(
                width: _itemWidth,
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                  child: _textRate(coin.changeRate),
                ),
              ),
              SizedBox(height: _itemVerticalSpace),
              SizedBox(
                width: _itemWidth,
                height: _itemHeight,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                  child: _textSubPrice(coin.tradePrice),
                ),
              ),
            ],
          ),
          // 프리미엄
          if (platform != "BINANCE" && target == "KRW")
            Row(
              children: [
                SizedBox(width: _itemHorizontalSpace),
                Column(
                  children: [
                    SizedBox(
                      width: _itemWidth,
                      height: _itemHeight,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerRight,
                        child: _textRate(coin.changeRate),
                      ),
                    ),
                    SizedBox(height: _itemVerticalSpace),
                    SizedBox(
                      width: _itemWidth,
                      height: _itemHeight,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerRight,
                        child: _textSubPrice(coin.tradePrice),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _textRate(double rate) {
    String _text = Helpers.parseToScaledRateText(rate) + "%";
    Color _color = rate == 0
        ? CustomColors.black
        : rate > 0
            ? CustomColors.red
            : CustomColors.blue;

    return Text(
      _text,
      style: TextStyle(color: _color),
    );
  }

  Widget _textTitlePrice(double price) {
    String _text = Helpers.parseToFormattedText(price);

    return Text(_text,
        style: const TextStyle(
          color: CustomColors.black,
        ));
  }

  Widget _textSubPrice(double price) {
    String _text = Helpers.parseToFormattedText(price);

    return Text(_text,
        style: const TextStyle(
          color: CustomColors.grey,
        ));
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
