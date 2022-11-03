part of 'rimender_bloc.dart';

abstract class RimenderEvent extends Equatable {
  const RimenderEvent();

  @override
  List<Object> get props => [];
}

class SetOnRimender implements RimenderEvent {
  bool status;

  SetOnRimender({this.status = true});
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class SetOffRimender implements RimenderEvent {
  bool status;

  SetOffRimender({this.status = false});
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class GetRimender implements RimenderEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
