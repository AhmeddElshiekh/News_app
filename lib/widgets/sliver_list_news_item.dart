import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_item.dart';

import '../models/news_model.dart';

class ListNewsItemAndCircleIndicator extends StatefulWidget {
  const ListNewsItemAndCircleIndicator({super.key, required this.category});
  final String category;
  @override
  State<ListNewsItemAndCircleIndicator> createState() => _ListNewsItemAndCircleIndicatorState();
}

class _ListNewsItemAndCircleIndicatorState extends State<ListNewsItemAndCircleIndicator> {
  var future ;
  @override
  void initState() {
    future =  NewsService().getHttp(category: widget.category);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: future,
      builder: (context, snapshot) {
        if(snapshot.hasData){
         return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => NewsItem(
                model: snapshot.data![index],
              ),
              childCount: snapshot.data!.length,
            ),
          );
        }
        else if(snapshot.hasError){
          return const SliverFillRemaining(
              child: Center(child: Text('Obs there is an error , please try later')));

        }else{
          return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()));
        }
      });


  }
}
