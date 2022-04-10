import 'package:flutter/material.dart';
import 'package:go_router_playground/model/news.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final NewsData data;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            Text(data.title, style: themeData.textTheme.titleLarge),
            const SizedBox(height: 32),
            Text(data.content, style: themeData.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
