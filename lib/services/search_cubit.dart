import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get (context) => BlocProvider.of(context);

  var searchController = TextEditingController();

  void ssearch(val){
    emit(SearchLoading());

    searchController.text = val;
    emit(SearchSuccess());

  }

  String search = '';


}
