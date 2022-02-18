import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/calendar_modal.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/service/coryn_service.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:collection/collection.dart';

class CalendarController extends GetxController {
  final _corynService = CorynService();

  List<News> newsList = [];
  DateTime today = DateTime.now();
  bool isLoading = false;

  @override
  void onInit() {
    fetchGoodNewsList();
    super.onInit();
  }

  void fetchGoodNewsList() async {
    _updateIsLoading(true);
    newsList = await _corynService.fetchNews(null, "good", null) ?? [];
    update();
    _updateIsLoading(false);
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }

  void updateToday(DateTime value) {
    today = value;
    update();
  }
}

// class CorynCalendarModalController extends GetxController {
//   final _coinService = CoinService();
//   final _corynCalendarcontroller = Get.find<CorynCalendarController>();

//   List<CalendarModal> calendarModalList = [];
//   DateTime today = DateTime.now();
//   bool isLoading = false;
//   bool isClick = false;

//   // void updateCalendarModalList(List<String> marketList) async {
//   //   List<Calendar> _calendarList = [..._corynCalendarcontroller.calendarList];
//   //   _updateIsLoading(true);
//   //   calendarModalList.clear();
//   //   for (var market in marketList) {
//   //     List<Coin>? _coinList = await _coinService.fetchCoinList("upbit");
//   //     if (_coinList == null) {
//   //       print("CalendarController updateCalendarModalList: _coinList is null");
//   //       return null;
//   //     }
//   //     Coin? _coin = _coinList.firstWhereOrNull(
//   //         (_item) => _item.target + '-' + _item.base == market);

//   //     if (_coin == null) {
//   //       print("CalendarController updateCalendarModalList: _coin is null");
//   //       return null;
//   //     }
//   //     List<News> _newsList = [];
//   //     for (var _calendar in _calendarList) {
//   //       if (market == _calendar.market) _newsList.add(_calendar.news);
//   //     }
//   //     calendarModalList.add(CalendarModal(coin: _coin, newsList: _newsList));
//   //   }
//   //   update();
//   //   _updateIsLoading(false);
//   // }

//   void updateToday(DateTime date) {
//     today = date;
//     update();
//   }

//   void updateClick() {
//     isClick = !isClick;
//     update();
//   }

//   void _updateIsLoading(bool currentStatus) {
//     isLoading = currentStatus;
//     update();
//   }
// }
