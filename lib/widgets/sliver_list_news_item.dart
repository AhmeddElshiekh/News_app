import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_item.dart';

import '../models/news_model.dart';

class ListNewsItemAndCircleIndicator extends StatefulWidget {
  const ListNewsItemAndCircleIndicator({super.key, required this.category, });
  final String category;

  @override
  State<ListNewsItemAndCircleIndicator> createState() => _ListNewsItemAndCircleIndicatorState();
}
var future;
class _ListNewsItemAndCircleIndicatorState extends State<ListNewsItemAndCircleIndicator> {
  @override
  void initState() {
    future = NewsService().getHttpSearch(search: widget.category);

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
                child: Center(child: Column(
                  children: [
                    Image(image: AssetImage('assets/undraw_Warning_re_eoyh.png')),
                    Text('Oops, there is an error, please try later',style: TextStyle(
                        fontSize: 20
                    )),
                  ],
                )));

          }else{
            return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()));
          }
        });


  }
}
