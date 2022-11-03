import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundamental_flutter/model/restourant_model.dart';

import '../../data/db/database_helper.dart';

part 'favorite_data_event.dart';
part 'favorite_data_state.dart';

class FavoriteDataBloc extends Bloc<FavoriteDataEvent, FavoriteDataState> {
  FavoriteDataBloc() : super(FavoriteDataInitial()) {
    var database = DatabaseHelper();

    on<GetFavoriteRestourant>((event, emit) async {
      emit(FavoriteDataLoading());
      try {
        var dataFavorite = await database.getFavorites();
        emit(FavoriteDataLoaded(dataFavorite));
        if (dataFavorite.isEmpty) {
          emit(FavoriteDataEmpty());
        }
      } catch (e) {
        emit(FavoriteDataMessage(e.toString()));
      }
    });
  }
}
