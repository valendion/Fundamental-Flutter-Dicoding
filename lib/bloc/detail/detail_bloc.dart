import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundamental_flutter/data/repository/restourant_repository.dart';

import '../../model/response_detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    RestourantRepository restourantRepository = RestourantRepository();
    on<GetDetailRestourant>((event, emit) async {
      emit(DetailLoading());
      var responseDetailRestourant =
          await restourantRepository.getDetailRestourant(event.id);
      var restourant = responseDetailRestourant.restaurant;

      if (restourant != null) {
        emit(DetailLoaded(restourant));
      } else {
        emit(DetailShowMessageError(responseDetailRestourant.errorMessage!));
      }
    });
  }
}
