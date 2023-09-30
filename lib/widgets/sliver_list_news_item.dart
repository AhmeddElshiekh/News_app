import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_item.dart';

import '../models/news_model.dart';

class ListNewsItemAndCircleIndicator extends StatefulWidget {
  const ListNewsItemAndCircleIndicator({super.key});

  @override
  State<ListNewsItemAndCircleIndicator> createState() => _ListNewsItemAndCircleIndicatorState();
}

class _ListNewsItemAndCircleIndicatorState extends State<ListNewsItemAndCircleIndicator> {
  List<NewsModel> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    newsList = await NewsService().getHttp();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()))
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NewsItem(
                model: newsList[index],
              ),
              childCount: newsList.length,
            ),
          );
  }
}
