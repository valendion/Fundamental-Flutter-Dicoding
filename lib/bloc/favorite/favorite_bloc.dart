import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundamental_flutter/data/db/database_helper.dart';

import '../../model/restourant_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    var database = DatabaseHelper();

    on<FavoriteRestourant>((event, emit) async {
      try {
        await database.insertFavorite(event.restourants);
        emit((FavoriteMessage("Restourant Liked")));
        emit(FavoriteLoadedRestourant(event.status));
      } catch (e) {
        emit((FavoriteError(e.toString())));
      }
    });

    on<NotFavoriteRestourant>((event, emit) async {
      try {
        await database.removeFavorite(event.id);
        emit((FavoriteMessage("Restourant Disliked")));
        emit(FavoriteLoadedRestourant(event.status));
      } catch (e) {
        emit((FavoriteError(e.toString())));
      }
    });

    on<IsFavoriteRestourant>((event, emit) async {
      try {
        var status = await database.getFavoriteById(event.id);
        emit(FavoriteRestourantStatus(status.isNotEmpty));
      } catch (e) {
        emit((FavoriteError(e.toString())));
      }
    });
  }
}
