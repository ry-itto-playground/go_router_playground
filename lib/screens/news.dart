import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_playground/model/news.dart';
import 'package:go_router_playground/router.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ListView.separated(
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(newsData[index].title),
          onTap: () {
            router.go(NewsDetailRoute(id: newsData[index].id - 1).location);
          },
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
