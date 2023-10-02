import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/widgets/change_mode.dart';
import 'package:news_app/widgets/list_item_category.dart';
import 'package:news_app/widgets/sliver_list_news_item.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: RichText(
                text:  TextSpan(
                  text: 'News',
                  style: TextStyle(color:NewsCubit.get(context).isLight == true ? Colors.white :Colors.black, fontSize: 24),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Cloud', style: TextStyle(color: Colors.yellow)),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SearchScreen(),));
                  }, icon: const Icon(Icons.search)),
                ),
                const ChangeMode(),
              IconButton(onPressed: (){
                NewsCubit.get(context).showMemberMenu( context);
              }, icon: const Icon(Icons.menu))
              ],
            ),

            body: const Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: ListItemCategory(),
                  ),
                  ListNewsItemAndCircleIndicator(category: 'General',),
                ],
              ),
            ));
      },
    );
  }
}
