import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/calendar_modal.dart';
import 'package:mobile/models/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:collection/collection.dart';

class CalendarController extends GetxController {
  final _newsService = NewsService();

  bool isOkCalendarList = false;

  @override
  void onInit() {
    super.onInit();
  }

  // void updateCalendarList() async {
  //   _updateIsLoading(false);
  //   List<News> _newsList = await _newsService.fetchGoodNews();

  //   for (int i = 0; i < _newsList.length; i++) {
  //     List<String> _baseList = [];
  //     for (var _market in _newsList[i].marketList) {
  //       var _base = _market.toString().split('-')[1];
  //     }
  //     for (var _market in _newsList[i].marketList) {
  //       var _symbol = _market.toString().split("-")[1];
  //       if (!_symbolList.contains(_symbol)) {
  //         _symbolList.add(_symbol);
  //         calendarList.add(Calendar(market: _market, news: _newsList[i]));
  //       }
  //     }
  //   }
  //   update();
  //   _updateIsLoading(true);
  // }

  void _updateIsLoading(bool value) {
    isOkCalendarList = value;
    update();
  }
}

class CorynCalendarController extends GetxController {
  final _newsService = NewsService();

  List<Calendar> calendarList = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    updateCalendarList();
  }

  void updateCalendarList() async {
    List<News> _newsList;
    _updateIsLoading(true);
    _newsList = await _newsService.fetchGoodNews();
    for (int i = 0; i < _newsList.length; i++) {
      List<String> _symbolList = [];
      for (var _market in _newsList[i].marketList) {
        var _symbol = _market.toString().split("-")[1];
        if (!_symbolList.contains(_symbol)) {
          _symbolList.add(_symbol);
          calendarList.add(Calendar(market: _market, news: _newsList[i]));
        }
      }
    }
    update();
    _updateIsLoading(false);
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
}

class CorynCalendarModalController extends GetxController {
  final _coinService = CoinService();
  final _corynCalendarcontroller = Get.find<CorynCalendarController>();

  List<CalendarModal> calendarModalList = [];
  DateTime today = DateTime.now();
  bool isLoading = false;
  bool isClick = false;

  // void updateCalendarModalList(List<String> marketList) async {
  //   List<Calendar> _calendarList = [..._corynCalendarcontroller.calendarList];
  //   _updateIsLoading(true);
  //   calendarModalList.clear();
  //   for (var market in marketList) {
  //     List<Coin>? _coinList = await _coinService.fetchCoinList("upbit");
  //     if (_coinList == null) {
  //       print("CalendarController updateCalendarModalList: _coinList is null");
  //       return null;
  //     }
  //     Coin? _coin = _coinList.firstWhereOrNull(
  //         (_item) => _item.target + '-' + _item.base == market);

  //     if (_coin == null) {
  //       print("CalendarController updateCalendarModalList: _coin is null");
  //       return null;
  //     }
  //     List<News> _newsList = [];
  //     for (var _calendar in _calendarList) {
  //       if (market == _calendar.market) _newsList.add(_calendar.news);
  //     }
  //     calendarModalList.add(CalendarModal(coin: _coin, newsList: _newsList));
  //   }
  //   update();
  //   _updateIsLoading(false);
  // }

  void updateToday(DateTime date) {
    today = date;
    update();
  }

  void updateClick() {
    isClick = !isClick;
    update();
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
}
