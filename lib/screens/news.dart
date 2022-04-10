import 'package:flutter/material.dart';
import 'package:go_router_playground/model/news.dart';

import 'news/detail.dart';

const List<NewsData> _data = [
  NewsData(
    title: 'Feb 3, 2022, Windows Support: 2.10 release',
    content:
        'Desktop support for Microsoft Windows (a central feature of the 2.10 release) is live! For more information, see Announcing Flutter for Windows and What’s new in Flutter 2.10, free articles on Medium.',
  ),
  NewsData(
    title: 'December 8, 2021: 2.8 release',
    content:
        'Flutter 2.8 is live! For details, see Announcing Flutter 2.8 and What’s new in Flutter 2.8.',
  ),
];

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_data[index].title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NewsDetailScreen(
                    data: _data[index],
                  );
                },
              ),
            );
          },
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
