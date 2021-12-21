class Coin {
  final int id;
  final String market;
  final String koreanName;
  final String englishName;
  final String logoUri;

  Coin({
    required this.id,
    required this.market,
    required this.koreanName,
    required this.englishName,
    required this.logoUri,
  });
}

Coin dummyBitcoinCoin = Coin(
  id: 0,
  market: "BTC",
  koreanName: "비트코인",
  englishName: "Bitcoin",
  logoUri: "https://static.upbit.com/logos/BTC.png",
);

Coin dummyDogecoinCoin = Coin(
  id: 1,
  market: "DOGE",
  koreanName: "도지코인",
  englishName: "Dogecoin",
  logoUri: "https://static.upbit.com/logos/DOGE.png",
);

Coin dummyStacksCoin = Coin(
  id: 2,
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
