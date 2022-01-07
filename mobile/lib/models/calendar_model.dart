import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/calendar.dart';
import 'package:mobile/service/coin_service.dart';
import 'package:mobile/service/price_service.dart';
import 'package:mobile/service/news_service.dart';

class CalendarModel {
  final _coinService = CoinService();
  final _newsService = NewsService();

  Future<List<Calendar>?> fetchCalendar() async {
    List<News> _newsList;
    List<Calendar> _calendarList = [];

    _newsList = await _newsService.fetchGoodNews();
    for (int i = 0; i < _newsList.length; i++) {
      List<String> _symbolList = [];
      for (var _market in _newsList[i].marketList) {
        var _symbol = _market.toString().split("-")[1];
        if (!_symbolList.contains(_symbol)) {
          _symbolList.add(_symbol);
          _calendarList.add(Calendar(market: _market, news: _newsList[i]));
        }
      }
    }

    return _calendarList;
  }
}
