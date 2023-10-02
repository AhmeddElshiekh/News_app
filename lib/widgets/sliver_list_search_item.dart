import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_item.dart';

import '../models/news_model.dart';

class ListSearchItem extends StatefulWidget {
  const ListSearchItem({super.key, required this.search});

  final String search;

  @override
  State<ListSearchItem> createState() => _ListSearchItemState();
}

class _ListSearchItemState extends State<ListSearchItem> {
  var future;

  @override
  void initState() {
    future = NewsService().getHttpSearch(search: widget.search);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                    NewsItem(
                      model: snapshot.data![index],
                    ),
                childCount: snapshot.data!.length,
              ),
            );

          }
          else if (snapshot.hasError) {
            return const SliverFillRemaining(
                child: Center(child: Text(
                    'Oops, there is an error, please try later')));
          } else {
            return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
