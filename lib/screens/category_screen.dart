import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/sliver_list_news_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title:Text(model.name),

        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12),
          child: CustomScrollView(
            slivers: [
                ListNewsItemAndCircleIndicator(
                  category: model.name,
                ),

            ],
          ),
        ));
  }
}




// if (state is NewsSelectCountryState2 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'ar',
//   ),
// if (state is NewsSelectCountryState3 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'at',
//   ),
// if (state is NewsSelectCountryState4 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'au',
//   ),
// if (state is NewsSelectCountryState5 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'be',
//   ),
// if (state is NewsSelectCountryState6 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'bg',
//   ),
// if (state is NewsSelectCountryState7 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'br',
//   ),
// if (state is NewsSelectCountryState8 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'ca',
//   ),
// if (state is NewsSelectCountryState9 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'ch',
//   ),
// if (state is NewsSelectCountryState10 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'cn',
//   ),
// if (state is NewsSelectCountryState11 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'co',
//   ),
// if (state is NewsSelectCountryState12 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'cz',
//   ),
// if (state is NewsSelectCountryState13 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'de',
//   ),
// if (state is NewsSelectCountryState14 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'eg',
//   ),
// if (state is NewsSelectCountryState15 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'fr',
//   ),
// if (state is NewsSelectCountryState16 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'us',
//   ),
// if (state is NewsSelectCountryState17 )
//   ListNewsItemAndCircleIndicator(
//     category: model.name,
//     country: 'jp',
//   ),