import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<NewsModel> newsList = [];

  late String val;

  getNews({required String category}) async {
    try {
      emit(GetNewsLoadingState());
      newsList =
      await NewsService().getHttp(category: category,);
      emit(GetNewsSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetNewsErrorState());
    }
  }


}
//
//   final List<String> country = [
//     'الإمارات',
//     'الأرجنتين',
//     'النمسا',
//     'أستراليا',
//     'بلجيكا',
//     'بلغاريا',
//     'البرازيل',
//     'كندا',
//     'سويسرا',
//     'الصين',
//     'كولومبيا',
//     'التشيك',
//     'ألمانيا',
//     'مصر',
//     'فرنسا',
//     'امريكا',
//     'اليابان'
//   ];
//
//   void showMemberMenu(context)async {
//     await showMenu(
//       context: context,
//       position: const RelativeRect.fromLTRB(200, 150, 100, 500),
//       items: List.generate(
//         country.length,
//         (index) => PopupMenuItem(
//           value: index,
//           child: Text(
//             country[index],
//             style: const TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       elevation: 8.0,
//     ).then((value) {
//       switch (value) {
//         case 0:
//           // val = 'ae';
//           // print(val);
//           emit(NewsSelectCountryState1());
//           break;
//         case 1:
//           // val = 'ar';
//           emit(NewsSelectCountryState2());
//           break;
//         case 2:
//           // val = 'at';
//           emit(NewsSelectCountryState3());
//
//           break;
//         case 3:
//           // val = 'au';
//           emit(NewsSelectCountryState4());
//           break;
//         case 4:
//           // val = 'be';
//           emit(NewsSelectCountryState5());
//
//           break;
//         case 5:
//           // val = 'bg';
//           emit(NewsSelectCountryState6());
//           break;
//         case 6:
//           // val = 'br';
//           emit(NewsSelectCountryState7());
//           break;
//         case 7:
//           // val = 'ca';
//           emit(NewsSelectCountryState8());
//           break;
//         case 8:
//           // val = 'ch';
//           emit(NewsSelectCountryState9());
//           break;
//         case 9:
//           // val = 'cn';
//           emit(NewsSelectCountryState10());
//           break;
//         case 10:
//           // val = 'co';
//           emit(NewsSelectCountryState11());
//           break;
//         case 11:
//           // val = 'cz';
//           emit(NewsSelectCountryState12());
//           break;
//         case 12:
//           // val = 'de';
//           emit(NewsSelectCountryState13());
//           break;
//         case 13:
//           // val = 'eg';
//           emit(NewsSelectCountryState14());
//           break;
//         case 14:
//           // val = 'fr';
//           emit(NewsSelectCountryState15());
//           break;
//         case 15:
//           // val = 'us';
//           emit(NewsSelectCountryState16());
//           break;
//         case 16:
//           // val = 'jp';
//           emit(NewsSelectCountryState17());
//           break;
//         default:
//           // val = 'us';
//
//       }
//     });
//   }
//
//   final List<String> country1 = [
//     'ae',
//     'ar',
//     'at',
//     'au',
//     'be',
//     'bg',
//     'br',
//     'ca',
//     'ch',
//     'cn',
//     'co',
//     'cz',
//     'de',
//     'eg',
//     'fr',
//     'us',
//     'jp'
//   ];
// }
