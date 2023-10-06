import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);


  // String? c;
  // void cc(){
  //    c='ar';
  //    print(c);
  //   emit(NewsSelectCountryState());
  // }

  //
  // void showMemberMenu(context) async {
  //   await showMenu(
  //     context: context,
  //     position: const RelativeRect.fromLTRB(200, 150, 100, 500),
  //     items: List.generate(
  //       country.length,
  //       (index) => PopupMenuItem(
  //         value: 1,
  //         child: Text(
  //           country[index],
  //           style: const TextStyle(
  //             fontSize: 15,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //     elevation: 8.0,
  //   ).then((value) {
  //     if (value != null) {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
  //     };
  //   });
  // }
  //
  // final List<String> country = [
  //   'الإمارات',
  //   'الأرجنتين',
  //   'النمسا',
  //   'أستراليا',
  //   'بلجيكا',
  //   'بلغاريا',
  //   'البرازيل',
  //   'كندا',
  //   'سويسرا',
  //   'الصين',
  //   'كولومبيا',
  //   'التشيك',
  //   'ألمانيا',
  //   'مصر',
  //   'فرنسا',
  //   'امريكا',
  //   'اليابان'
  // ];
  // final List<String> country1 = [
  //   'ae',
  //   'ar',
  //   'at',
  //   'au',
  //   'be',
  //   'bg',
  //   'br',
  //   'ca',
  //   'ch',
  //   'cn',
  //   'co',
  //   'cz',
  //   'de',
  //   'eg',
  //   'fr',
  //   'us',
  //   'jp'
  // ];
  //
  //
  // // List<dynamic> business = [];
  // //
  // // void getBusiness({required String category}) {
  // //   emit(NewsGetBusinessLoadingState());
  // //    NewsService().getHttp(category: category).then((value) {
  // //     business = value.data['articles'];
  // //     emit(NewsGetBusinessSuccessState());
  // //   }).catchError((error) {
  // //     print('Error when getBusiness is ${error.toString()}');
  // //     emit(NewsGetBusinessErrorState());
  // //   });
  // // }


}
