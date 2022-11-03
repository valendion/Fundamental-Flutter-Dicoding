part of 'rimender_bloc.dart';

abstract class RimenderState extends Equatable {
  const RimenderState();

  @override
  List<Object> get props => [];
}

class RimenderInitial implements RimenderState {
  bool status;

  RimenderInitial({this.status = false});
  @override
  // TODO: implement props
  List<Object> get props => [status];

  @override
  // TODO: implement stringify
  bool? get stringify => false;
}

class RimenderLoaded implements RimenderState {
  bool status;

  RimenderLoaded(this.status);
  @override
  List<Object> get props => [status];

  @override
  bool? get stringify => false;
}

class RimenderMessage implements RimenderState {
  String message;

  RimenderMessage(this.message);
  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}
