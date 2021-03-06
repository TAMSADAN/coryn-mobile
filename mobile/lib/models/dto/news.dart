class News {
  final int id;
  final String base;
  final String title;
  final DateTime? postedDate;
  final DateTime? targetingDate;
  final String type;
  final String source;
  final String url;

  News({
    required this.id,
    required this.base,
    required this.title,
    required this.postedDate,
    required this.targetingDate,
    required this.type,
    required this.source,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json["id"],
      base: json["ticker"],
      title: json["title"],
      postedDate: json["posted_date"] != null
          ? DateTime.parse(json["posted_date"])
          : null,
      targetingDate: json["targeting_date"] != null
          ? DateTime.parse(json["targeting_date"])
          : null,
      type: json["type"],
      source: json["source"],
      url: json["url"],
    );
  }

  getStringFromDatetime(DateTime _datetime) {
    return _datetime.year.toString() +
        "-" +
        _datetime.month.toString() +
        "-" +
        _datetime.day.toString();
  }
}

// List<News> dummyBitcoinNewsList = [
//   News(
//     id: 0,
//     title: "[코인 투자 분석] 반등세를 이끈 비트코인 미결제약정",
//     postedDate: DateTime(2021, 12, 21),
//     targetingDate: DateTime(2021, 12, 21),
//     newsType: "news",
//     source: "coindesk",
//     url: "https://www.coindeskkorea.com/news/articleView.html?idxno=76735",
//   ),
//   News(
//     id: 1,
//     title: "비트코인 3개월만에 최저 수준…전날 한때 4만5천 달러대까지 내려",
//     postedDate: DateTime(2021, 12, 21),
//     targetingDate: DateTime(2021, 12, 21),
//     newsType: "good",
//     source: "매일신문",
//     url: "http://news.imaeil.com/page/view/2021122109201682305",
//   ),
// ];

// List<News> dummyDogecoinNewsList = [
//   News(
//     id: 2,
//     title: "도지코인 뉴스 2",
//     postedDate: DateTime(2021, 12, 22),
//     targetingDate: DateTime(2021, 12, 22),
//     newsType: "good",
//     source: "coindesk",
//     url: "https://www.coindeskkorea.com/news/articleView.html?idxno=76735",
//   ),
//   News(
//     id: 3,
//     title: "도지코인 뉴스 1",
//     postedDate: DateTime(2021, 12, 21),
//     targetingDate: DateTime(2021, 12, 22),
//     newsType: "good",
//     source: "매일신문",
//     url: "http://news.imaeil.com/page/view/2021122109201682305",
//   ),
// ];
