part of 'favorite_data_bloc.dart';

abstract class FavoriteDataState extends Equatable {
  const FavoriteDataState();

  @override
  List<Object> get props => [];
}

class FavoriteDataInitial implements FavoriteDataState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class FavoriteDataLoaded implements FavoriteDataState {
  List<Restaurants> restourants;

  FavoriteDataLoaded(this.restourants);
  @override
  List<Object> get props => [restourants];

  @override
  bool? get stringify => false;
}

class FavoriteDataLoading implements FavoriteDataState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class FavoriteDataMessage implements FavoriteDataState {
  String message;

  FavoriteDataMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}

class FavoriteDataEmpty implements FavoriteDataState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
