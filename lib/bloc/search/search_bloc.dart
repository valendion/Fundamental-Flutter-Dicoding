import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/data/repository/restourant_repository.dart';

import '../../model/restourant_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    RestourantRepository restourantRepository = RestourantRepository();
    on<EmptyInput>((event, emit) {
      emit(SearchInput());
    });
    on<GetSearchRestaurant>((event, emit) async {
      emit(SearchLoading());

      var responseSearch =
          await restourantRepository.getSearchRestourant(event.id);
      var searchRestourant = responseSearch.restaurants;

      if (searchRestourant != null) {
        emit(SearchLoaded(searchRestourant));
      } else {
        emit(SearchShowMessageError(responseSearch.errorMessage!));
      }
    });
  }
}
