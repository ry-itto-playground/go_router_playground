import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_playground/model/news.dart';

import 'news/detail.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(newsData[index].title),
          onTap: () {
            GoRouter.of(context).push('/news/${newsData[index].id}');
          },
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
