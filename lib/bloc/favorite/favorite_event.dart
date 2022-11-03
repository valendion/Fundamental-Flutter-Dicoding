part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteRestourant implements FavoriteEvent {
  bool status;
  Restaurants restourants;
  FavoriteRestourant({this.status = true, required this.restourants});

  @override
  List<Object> get props => [status, restourants];

  @override
  // TODO: implement stringify
  bool? get stringify => false;
}

class NotFavoriteRestourant implements FavoriteEvent {
  bool status;
  String id;

  NotFavoriteRestourant({this.status = false, this.id = ''});

  @override
  List<Object> get props => [status, id];

  @override
  bool? get stringify => false;
}

class IsFavoriteRestourant implements FavoriteEvent {
  String id;

  IsFavoriteRestourant({this.id = ''});

  @override
  List<Object> get props => [id];

  @override
  bool? get stringify => false;
}
