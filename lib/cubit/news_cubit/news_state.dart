part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsSelectCountryState extends NewsState {}


class NewsGetNewsLoadingState extends NewsState {}
class NewsGetNewsSuccessState extends NewsState {}
class NewsGetNewsErrorState extends NewsState {}