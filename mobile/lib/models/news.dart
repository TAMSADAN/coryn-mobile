class News {
  final String title;
  final DateTime createDate;
  final DateTime targetDate;
  final String sourceUri;
  final String sourceName;

  News({
    required this.title,
    required this.createDate,
    required this.targetDate,
    required this.sourceUri,
    required this.sourceName,
  });
}

List<News> bitcoinNewsList = [
  News(
      title: "비트코인 뉴스 1",
      createDate: DateTime(2021, 12, 19),
      targetDate: DateTime(2021, 12, 19),
      sourceUri: "sourceUri",
      sourceName: "sourceName"),
  News(
      title: "비트코인 뉴스 2",
      createDate: DateTime(2021, 12, 19),
      targetDate: DateTime(2021, 12, 19),
      sourceUri: "sourceUri",
      sourceName: "sourceName"),
  News(
      title: "비트코인 뉴스 3",
      createDate: DateTime(2021, 12, 19),
      targetDate: DateTime(2021, 12, 19),
      sourceUri: "sourceUri",
      sourceName: "sourceName"),
];
