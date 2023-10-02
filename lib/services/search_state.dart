part of 'search_cubit.dart';

@immutable
abstract class SearchStates {}

class SearchInitial extends SearchStates {}
class SearchLoading extends SearchStates {}
class SearchSuccess extends SearchStates {}


