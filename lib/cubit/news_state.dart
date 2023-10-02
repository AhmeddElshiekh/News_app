part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsChangeModeState extends NewsState {}
class NewsSelectCountryState extends NewsState {}


class NewsGetBusinessLoadingState extends NewsState {}
class NewsGetBusinessSuccessState extends NewsState {}
class NewsGetBusinessErrorState extends NewsState {}