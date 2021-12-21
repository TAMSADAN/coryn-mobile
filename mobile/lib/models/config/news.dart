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

  getStringFromDatetime(DateTime _datetime) {
    return _datetime.year.toString() +
        "-" +
        _datetime.month.toString() +
        "-" +
        _datetime.day.toString();
  }
}

List<News> dummyNewsList = [
  News(
      title: "비트코인 뉴스 1",
      createDate: DateTime(2021, 12, 19),
      targetDate: DateTime(2021, 12, 20),
      sourceUri: "sourceUri",
      sourceName: "good"),
  News(
      title: "비트코인 뉴스 2",
      createDate: DateTime(2021, 12, 20),
      targetDate: DateTime(2021, 12, 22),
      sourceUri: "sourceUri",
      sourceName: "sourceName 2"),
  News(
      title: "비트코인 뉴스 3",
      createDate: DateTime(2021, 12, 21),
      targetDate: DateTime(2021, 12, 23),
      sourceUri: "sourceUri",
      sourceName: "sourceName 3"),
  News(
      title: "비트코인 뉴스 4",
      createDate: DateTime(2021, 12, 23),
      targetDate: DateTime(2021, 12, 23),
      sourceUri: "sourceUri",
      sourceName: "good"),
  News(
      title: "비트코인 뉴스 5",
      createDate: DateTime(2021, 12, 24),
      targetDate: DateTime(2021, 12, 24),
      sourceUri: "sourceUri",
      sourceName: "good"),
  News(
      title: "비트코인 뉴스 6",
      createDate: DateTime(2021, 12, 25),
      targetDate: DateTime(2021, 12, 25),
      sourceUri: "sourceUri",
      sourceName: "good"),
];
