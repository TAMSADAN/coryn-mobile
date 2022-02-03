import 'package:get/get.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/service/news_service.dart';

class CorynCalendarController extends GetxController {
  final _newsService = NewsService();

  List<Calendar> calendarList = [];
  List<Calendar> todayCalendarList = [];
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

  void updateTodayCalendarList(List<String> marketList) {
    List<Calendar> _calendarList = [...calendarList];
    todayCalendarList.clear();

    for (var market in marketList) {
      for (var _calendar in _calendarList) {
        if (market == _calendar.market &&
            !todayCalendarList.contains(_calendar)) {
          todayCalendarList.add(_calendar);
        }
      }
    }
    update();
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
}

class CorynCalendarModalController extends GetxController {
  final _corynCalendarController = Get.find<CorynCalendarController>();
}
