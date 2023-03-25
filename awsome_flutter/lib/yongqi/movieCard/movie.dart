class Movie {
  const Movie({
    required this.name,
    required this.poster,
    required this.date,
    required this.intro,
    required this.price,
  });
  // 海报图片
  final String poster;
  // 名称
  final String name;
  // 上映日期
  final String date;
  // 简介
  final String intro;
  // 票价
  final String price;
}
