import 'package:mobile/models/summary.dart';

class Coin {
  final String market;
  final String koreanName;
  final String englishName;
  final String logoUri;

  Coin({
    required this.market,
    required this.koreanName,
    required this.englishName,
    required this.logoUri,
  });
}

Coin dummyBitcoinCoin = Coin(
  market: "BTC",
  koreanName: "비트코인",
  englishName: "Bitcoin",
  logoUri: "https://static.upbit.com/logos/BTC.png",
);

Coin dummyDogecoinCoin = Coin(
  market: "DOGE",
  koreanName: "도지코인",
  englishName: "Dogecoin",
  logoUri: "https://static.upbit.com/logos/DOGE.png",
);

Coin dummyStacksCoin = Coin(
  market: "STX",
  koreanName: "스택스",
  englishName: "Stacks",
  logoUri: "https://static.upbit.com/logos/STX.png",
);

List<Coin> dummyCoinList = [
  dummyBitcoinCoin,
  dummyDogecoinCoin,
  dummyStacksCoin
];
