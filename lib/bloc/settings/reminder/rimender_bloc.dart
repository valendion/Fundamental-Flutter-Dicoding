import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fundamental_flutter/utils/preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rimender_event.dart';
part 'rimender_state.dart';

class RimenderBloc extends Bloc<RimenderEvent, RimenderState> {
  RimenderBloc() : super(RimenderInitial()) {
    var preferences = SharedPreferences.getInstance();
    var prefHelper = PreferencesHelper(preferences);

    on<SetOnRimender>((event, emit) async {
      await prefHelper.setDailyNewsRestourantActive(event.status);
      emit(RimenderMessage('Menghidupkan Pengingat'));
      emit(RimenderLoaded(event.status));
    });

    on<SetOffRimender>((event, emit) async {
      await prefHelper.setDailyNewsRestourantActive(event.status);
      emit(RimenderMessage('Mematikan Pengingat'));
      emit(RimenderLoaded(event.status));
    });

    on<GetRimender>((event, emit) async {
      var statusPref = await prefHelper.isDailyNewsRestourantActive;

      emit(RimenderLoaded(statusPref));
    });
  }
}
