part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial implements HomeState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class HomeLoading implements HomeState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class HomeLoaded implements HomeState {
  List<Restaurants> restourants;

  HomeLoaded(this.restourants);

  @override
  List<Object> get props => [restourants];

  @override
  bool? get stringify => false;
}

class HomeShowMessageError implements HomeState {
  String message;

  HomeShowMessageError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}
