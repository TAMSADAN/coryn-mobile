class Price {
  final String platform;
  final String market;
  final List<double> openPriceList;
  final List<DateTime> priceDateList;

  Price({
    required this.platform,
    required this.market,
    required this.openPriceList,
    required this.priceDateList,
  });
}

List<Price> dummyPriceList = [
  Price(
    platform: "Upbit",
    market: "KRW",
    openPriceList: [
      101,
      102,
      103,
      104,
      105,
    ],
    priceDateList: [
      DateTime(2021, 12, 18),
      DateTime(2021, 12, 19),
      DateTime(2021, 12, 20),
      DateTime(2021, 12, 21),
      DateTime(2021, 12, 22),
    ],
  ),
  Price(
    platform: "Bitsum",
    market: "KRW",
    openPriceList: [
      107,
      106,
      105,
      103,
      101,
    ],
    priceDateList: [
      DateTime(2021, 12, 18),
      DateTime(2021, 12, 19),
      DateTime(2021, 12, 20),
      DateTime(2021, 12, 21),
      DateTime(2021, 12, 22),
    ],
  ),
];
