part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial implements SearchState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class SearchLoading implements SearchState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class SearchLoaded implements SearchState {
  List<Restaurants> restourants;

  SearchLoaded(this.restourants);

  @override
  List<Object> get props => [restourants];

  @override
  bool? get stringify => false;
}

class SearchShowMessageError implements SearchState {
  String message;

  SearchShowMessageError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}

class SearchInput implements SearchState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
