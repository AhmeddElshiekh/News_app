import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/check_internet/check_internet_cubit.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/widgets/change_mode.dart';
import 'package:news_app/widgets/list_item_category.dart';
import 'package:news_app/widgets/sliver_list_news_item.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckInternetCubit, CheckInternetState>(
      listener: (context, state) {
        if (state is ConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(state.message),
          ));
        }
        if (state is NotConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message),
          ));
        }
      },
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            title: const Row(
              children: [
                Text('News'),
                Text(
                  'Cloud',
                  style: TextStyle(color: Colors.yellow),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          ));
                    },
                    icon: const Icon(Icons.search)),
              ),
              const ChangeMode(),
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
                ListNewsItemAndCircleIndicator(
                  category: 'General',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// if (state is NewsSelectCountryState9)
//   const SliverFillRemaining(
//     child: Center(
//         child: Text(
//             'Please select the country first, if you want to select another country you should select \'سويسرا\' first then select any other country ')),
//   ),
// if (state is NewsSelectCountryState1)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'ae',
//   ),
// if (state is NewsSelectCountryState2)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'ar',
//   ),
// if (state is NewsSelectCountryState3)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'at',
//   ),
// if (state is NewsSelectCountryState4)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'au',
//   ),
// if (state is NewsSelectCountryState5)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'be',
//   ),
// if (state is NewsSelectCountryState6)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'bg',
//   ),
// if (state is NewsSelectCountryState7)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'br',
//   ),
// if (state is NewsSelectCountryState8)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'ca',
//   ),
// if (state is NewsSelectCountryState10)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'cn',
//   ),
// if (state is NewsSelectCountryState11)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'co',
//   ),
// if (state is NewsSelectCountryState12)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'cz',
//   ),
// if (state is NewsSelectCountryState13)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'de',
//   ),
// if (state is NewsSelectCountryState14)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'eg',
//   ),
// if (state is NewsSelectCountryState15)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'fr',
//   ),
// if (state is NewsSelectCountryState16)
//   const ListNewsItemAndCircleIndicator(
//     category: 'General',
//     country: 'us',
//   ),

// country: ChangeCountryCubit
//     .get(context)
// .val ?? 'us',

//
// if (state is NewsSelectCountryState4)
// const SliverFillRemaining(
// child: Center(
// child: Text(
// 'Please select the country first, if you want to select another country you should select \'سويسرا\' first then select any other country ')),
// ),
