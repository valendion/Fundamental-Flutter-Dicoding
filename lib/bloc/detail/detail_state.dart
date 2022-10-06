part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial implements DetailState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class DetailLoading implements DetailState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class DetailLoaded implements DetailState {
  Restaurant restaurant;

  DetailLoaded(this.restaurant);

  @override
  List<Object> get props => [restaurant];

  @override
  bool? get stringify => false;
}

class DetailShowMessageError implements DetailState {
  String message;

  DetailShowMessageError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}
