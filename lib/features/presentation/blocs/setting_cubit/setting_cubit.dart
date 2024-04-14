import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/const/app_defaults.dart';
import 'package:wahg_v1/const/app_keys.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/localization/app_localization/app_localization.dart';
import 'package:wahg_v1/localization/app_localization/languages_interface.dart';

import 'package:wahg_v1/const/app_theme.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/main.dart';
import 'package:wahg_v1/di/injection_container.dart' as di;
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState());

  Future<bool> getAppSettings() async {

    bool isDark = await di.sl<AppSettingsCache>().getDarkMode();
    String appLanguageCode = await di.sl<AppSettingsCache>().getAppLanguage();
    setAppLanguage(value: appLanguageCode);

    emit(state.copyWith(isDarkMode: isDark));
    return isDark;
  }



  Future<void> setAppLanguage({String? value, BuildContext? context}) async {
    log('🟪 PERFORMANCE (SettingCubit > setAppLanguage)');
    String cached;
    bool rtl;
    /// this to change App Language from settings
    if (value != null) {
      cached = value;
      await di.sl<AppSettingsCache>().setAppLanguage(value);
    } else {
      /// this to load App Language in start
      cached = await di.sl<AppSettingsCache>().getAppLanguage();
    }
    rtl = await di.sl<AppSettingsCache>().getRTL();
    txt = await const AppLocalizations().load(Locale(cached, ''));
    emit(state.copyWith(
        appLanguageCode: cached,
        appLanguageLocale: Locale(cached, ''),
        appStrings: txt,
        isRTL: rtl));
  }

  Future<void> changeTheme(String themeType) async {
bool isDark = (themeType == "dark")? true : false;
    await sl<AppSettingsCache>().setThemeData(themeType);
    await sl<AppSettingsCache>().setDarkMode(isDark);
    appTheme = ThemeHelper().themeColor();
    theme = ThemeHelper().themeData();

    emit(state.copyWith(themeType: themeType,appTheme: ThemeHelper().themeData(),isDarkMode:isDark));

  }

}

/// or you can use this code
/// await context.read<SettingCubit>().setAppLanguage(value: 'ar');
// Remove any route in the stack
// Navigator.of(context).popUntil((route) => false);
//
// // Add the first route. Note MyApp() would be your first widget to the app.
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => const MyApp()),
// );