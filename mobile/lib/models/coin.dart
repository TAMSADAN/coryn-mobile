class Coin {
  final String platform;
  final String baseSymbol;
  final String quoteSymbol;
  final String? koreanName;
  final String? englishName;
  final double tradePrice;
  final double changePrice;
  final double changeRate;
  final double volume;

  Coin({
    required this.platform,
    required this.baseSymbol,
    required this.quoteSymbol,
    required this.koreanName,
    required this.englishName,
    required this.tradePrice,
    required this.changePrice,
    required this.changeRate,
    required this.volume,
  });
}
