import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundamental_flutter/data/repository/restourant_repository.dart';
import 'package:fundamental_flutter/model/response_search.dart';

import '../../model/restourant_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    RestourantRepository restourantRepository = RestourantRepository();

    ResponseSearchRestourant responseSearch = ResponseSearchRestourant();

    on<EmptyInput>((event, emit) {
      responseSearch.restaurants?.clear();
      emit(SearchInput());
    });
    on<GetSearchRestaurant>((event, emit) async {
      try {
        emit(SearchLoading());

        responseSearch =
            await restourantRepository.getSearchRestourant(event.id);
        var searchRestourant = responseSearch.restaurants;

        print('Response error ' + responseSearch.error.toString());

        print(
            'Response error message ' + responseSearch.errorMessage.toString());
        print('Response Data ' + searchRestourant.toString());
        print('Response Data ' + (searchRestourant != null).toString());
        print('Response Data ' + (searchRestourant!.isNotEmpty).toString());

        if (responseSearch.errorMessage == null) {
          if (searchRestourant.isNotEmpty) {
            emit(SearchLoaded(searchRestourant));
          } else {
            emit(SearchEmpty());
          }
        } else {
          emit(SearchShowMessageError(responseSearch.errorMessage ?? ''));
        }
      } catch (e) {
        emit(SearchShowMessageError(e.toString()));
      }
    });
  }
}
