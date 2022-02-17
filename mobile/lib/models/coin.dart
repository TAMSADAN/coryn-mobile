class Coin {
  final String platform;
  final String base;
  final String target;
  final String? koreanName;
  final String? englishName;
  final double tradePrice;
  final double changePrice;
  final double changeRate;
  final double volume;

  Coin({
    required this.platform,
    required this.base,
    required this.target,
    required this.koreanName,
    required this.englishName,
    required this.tradePrice,
    required this.changePrice,
    required this.changeRate,
    required this.volume,
  });
}
