import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/detail/components/good_news_item.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';
import 'package:mobile/utils/secrets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarModal extends StatelessWidget {
  final Map<String, List<Coin>> coinData;
  final List<News> newsList;
  final List<dynamic> appointmentList;
  final DateTime today;
  final BuildContext context;

  final double _itemHeaderHeight = CustomScreenSizes.itemHeaderHeight.h;
  final double _itemHeight = CustomScreenSizes.itemHeight.h;
  final double _itemVerticalSpace = CustomScreenSizes.itemVertical.h;
  final double _itemHorizontalSpace = CustomScreenSizes.itemHorizontal.w;
  final double _itemImageHorizontalSpace =
      CustomScreenSizes.itemHorizontal.w / 2.0;

  CalendarModal({
    Key? key,
    required this.coinData,
    required this.newsList,
    required this.appointmentList,
    required this.today,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: _itemHeight / 2),
        SizedBox(
          height: _itemHeaderHeight,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              today.year.toString().replaceRange(0, 2, "") +
                  "년 " +
                  today.month.toString().padLeft(2, '0') +
                  "월 " +
                  today.day.toString().padLeft(2, '0') +
                  '일',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: _itemHeight / 2),
        Container(
          height: CustomScreenSizes.calendarModalVertical.h,
          child: ListView(
            children: [
              _itemList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemList() {
    List<Widget> _newsItemList = [];
    List<Widget> _platformButtonList = [];
    for (Appointment appointment in appointmentList) {
      // 아이템 헤더
      Widget _newsItemHeader = Row(
        children: [
          Container(
            width: _itemHeaderHeight,
            height: _itemHeaderHeight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                    "https://cryptoicon-api.vercel.app/api/icon/${appointment.subject.toLowerCase()}"),
              ),
            ),
          ),
          SizedBox(width: _itemImageHorizontalSpace),
          SizedBox(
            height: _itemHeaderHeight,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(appointment.subject),
            ),
          )
        ],
      );
      _newsItemList.add(_newsItemHeader);
      _newsItemList.add(SizedBox(height: _itemVerticalSpace * 2));
      // 플랫폼 버튼 리스트
      coinData.forEach(
        (key, value) {
          for (Coin _coin in value) {
            if (_coin.base == appointment.subject) {
              Widget _platformButton = GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(coin: _coin)),
                ),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: _itemHeight,
                            height: _itemHeight,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                image: AssetImage(
                                    Secrets.platformImageData[_coin.platform]!),
                              ),
                            ),
                          ),
                          SizedBox(height: _itemVerticalSpace),
                          SizedBox(
                            height: _itemHeight,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(_coin.base + '-' + _coin.target),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: _itemHeight * 2 + _itemHorizontalSpace,
                          child: VerticalDivider()),
                    ],
                  ),
                ),
              );

              _platformButtonList.add(_platformButton);
            }
          }
        },
      );
      if (_platformButtonList.isNotEmpty)
        _newsItemList.add(
          Container(
            height: _itemHeight * 3 + _itemHorizontalSpace,
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [..._platformButtonList],
            ),
          ),
        );
      _platformButtonList.clear();
      // 호재
      List<Widget> _goodNewsItemList = [];
      for (News _news in newsList) {
        if (_news.base == appointment.subject) {
          _goodNewsItemList.add(GoodNewsItem(news: _news));
          _goodNewsItemList.add(Divider());
        }
      }

      _newsItemList.add(Column(
        children: _goodNewsItemList,
      ));
    }

    return Column(
      children: _newsItemList,
    );
  }
}
