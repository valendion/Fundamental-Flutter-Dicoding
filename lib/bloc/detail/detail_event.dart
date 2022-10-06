part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailRestourant implements DetailEvent {
  String id;

  GetDetailRestourant(this.id);
  @override
  List<Object> get props => [id];

  @override
  bool? get stringify => false;
}
