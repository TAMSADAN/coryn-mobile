import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';

class Calendar {
  final Coin coin;
  final News news;

  Calendar({
    required this.coin,
    required this.news,
  });
}

List<Calendar> dummyCalendarList = [
  Calendar(coin: dummyBitcoinCoin, news: dummyBitcoinNewsList[0]),
  Calendar(coin: dummyBitcoinCoin, news: dummyBitcoinNewsList[1]),
  Calendar(coin: dummyDogecoinCoin, news: dummyDogecoinNewsList[0]),
  Calendar(coin: dummyDogecoinCoin, news: dummyDogecoinNewsList[1]),
];
