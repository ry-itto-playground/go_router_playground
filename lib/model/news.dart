class NewsData {
  const NewsData({
    required this.id,
    required this.title,
    required this.content,
  });

  final int id;
  final String title;
  final String content;
}

const List<NewsData> newsData = [
  NewsData(
    id: 1,
    title: 'Feb 3, 2022, Windows Support: 2.10 release',
    content:
        'Desktop support for Microsoft Windows (a central feature of the 2.10 release) is live! For more information, see Announcing Flutter for Windows and What’s new in Flutter 2.10, free articles on Medium.',
  ),
  NewsData(
    id: 2,
    title: 'December 8, 2021: 2.8 release',
    content:
        'Flutter 2.8 is live! For details, see Announcing Flutter 2.8 and What’s new in Flutter 2.8.',
  ),
];
