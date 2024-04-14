import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/di/injection_container.dart';

import '../theme_helper.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState) {

    on<ThemeChangeEvent>(_changeTheme);
  }

  _changeTheme(
    ThemeChangeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    await sl<AppSettingsCache>().setThemeData(event.themeType);
      appTheme = ThemeHelper().themeColor();
      theme = ThemeHelper().themeData();
    emit(state.copyWith(themeType: event.themeType,appTheme: ThemeHelper().themeData()));

  }
}
