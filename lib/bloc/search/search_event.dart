part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchRestaurant implements SearchEvent {
  String id;
  GetSearchRestaurant(this.id);
  @override
  List<Object> get props => [id];

  @override
  bool? get stringify => false;
}

class EmptyInput implements SearchEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
