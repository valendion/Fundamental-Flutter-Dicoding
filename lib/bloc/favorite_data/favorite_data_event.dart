part of 'favorite_data_bloc.dart';

abstract class FavoriteDataEvent implements Equatable {
  const FavoriteDataEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteRestourant implements FavoriteDataEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
