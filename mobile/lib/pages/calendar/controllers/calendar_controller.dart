import 'package:get/get.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/calendar_modal.dart';
import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/service/news_service.dart';
import 'package:mobile/service/coin_service.dart';

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
  bool isLoading = false;

  void updateCalendarModalList(List<String> marketList) async {
    List<Calendar> _calendarList = [..._corynCalendarcontroller.calendarList];
    _updateIsLoading(true);
    calendarModalList.clear();
    for (var market in marketList) {
      Coin _coin = await _coinService.fetchCoin(market);
      List<News> _newsList = [];
      for (var _calendar in _calendarList) {
        if (market == _calendar.market) _newsList.add(_calendar.news);
      }
      calendarModalList.add(CalendarModal(coin: _coin, newsList: _newsList));
    }
    update();
    _updateIsLoading(false);
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
}
