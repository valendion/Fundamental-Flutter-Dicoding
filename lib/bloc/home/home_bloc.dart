import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundamental_flutter/data/repository/restourant_repository.dart';
import 'package:fundamental_flutter/model/response_detail.dart';
import 'package:fundamental_flutter/model/restourant_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    RestourantRepository restourantRepository = RestourantRepository();

    on<GetAllRestaurant>((event, emit) async {
      emit(HomeLoading());
      var responseRestourants = await restourantRepository.getAllRestourant();
      var restourants = responseRestourants.restaurants;

      if (restourants != null) {
        emit(HomeLoaded(restourants));
      } else {
        emit(HomeShowMessageError(responseRestourants.errorMessage!));
      }
    });
  }
}
