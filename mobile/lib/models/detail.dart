import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/models/dto/price.dart';

class Detail {
  final Coin coin;
  final List<Price> priceList;
  final List<News>? newsList;

  Detail({
    required this.coin,
    required this.priceList,
    required this.newsList,
  });
}

// Detail dummyBitcoinDetail = Detail(
//   coin: dummyBitcoinCoin,
//   priceList: dummyBitcoinPriceList,
//   newsList: dummyBitcoinNewsList,
// );

// Detail dummyDogecoinDetail = Detail(
//   coin: dummyDogecoinCoin,
//   priceList: dummyDogecoinPriceList,
//   newsList: dummyDogecoinNewsList,
// );

// Detail dummyStacksDetail = Detail(
//   coin: dummyStacksCoin,
//   priceList: dummyStacksPriceList,
//   newsList: null,
// );
