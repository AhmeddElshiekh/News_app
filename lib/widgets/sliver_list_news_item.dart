import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_item.dart';

class ListNewsItem extends StatelessWidget {
  const ListNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const NewsItem(),
        childCount: 10,
      ),
    );
  }
}
