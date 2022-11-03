part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial implements FavoriteState {
  bool initialStatus;

  FavoriteInitial({this.initialStatus = false});
  @override
  List<Object> get props => [initialStatus];

  @override
  bool? get stringify => false;
}

class FavoriteLoadedRestourant implements FavoriteState {
  bool status;

  FavoriteLoadedRestourant(this.status);

  @override
  List<Object> get props => [status];

  @override
  bool? get stringify => false;
}

class FavoriteMessage implements FavoriteState {
  String message;

  FavoriteMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}

class FavoriteError implements FavoriteState {
  String message;

  FavoriteError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}

class FavoriteRestourantStatus implements FavoriteState {
  bool status;

  FavoriteRestourantStatus(this.status);

  @override
  List<Object> get props => [status];

  @override
  bool? get stringify => false;
}
