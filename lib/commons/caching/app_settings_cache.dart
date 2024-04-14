import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_defaults.dart';
import 'package:wahg_v1/const/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wahg_v1/di/injection_container.dart' as di;
import 'package:wahg_v1/theme/theme_helper.dart';

///
//This class to Cash App Settings (Theme,Language,...)
///
class AppSettingsCache extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;

  AppSettingsCache() {
    init();
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    di.sl.signalReady(this);
    print('[✅ Initialized] SharedPreference Initialized in AppSettingsCache');
  }

  ///will clear all the data stored in preference
  void clearAppSettingCachedData() async {
    //TODO [Fix this] this should only remove settings key only
    _sharedPreferences!.clear();
  }

  String getThemeData() {
    log('🟪 PERFORMANCE (AppSettingsCache > getThemeData)');

    try {
      return _sharedPreferences!.getString(themeDataKey) ?? themeDataDefault;
    } catch (e) {
      print('[⚠️ Warring] in AppSettingsCache > getThemeData : $e');
      return themeDataDefault;
    }
  }

  Future<void> setThemeData(String value) {
    log('🟪 PERFORMANCE (AppSettingsCache > setThemeData)');

    try {
      return _sharedPreferences!.setString(themeDataKey, value);
    } catch (e) {
      throw Exception('[❌ Error] in AppSettingsCache > setThemeData : $e');

    }

  }

  Future<bool> getDarkMode() async {
    log('🟪 PERFORMANCE (AppSettingsCache > getDarkMode)');

    try {
      return _sharedPreferences!.getBool(isDarkModeKey) ?? isDarkModeDefault;
    } catch (e) {
      print('[⚠️ Warring] in AppSettingsCache > getDarkMode : $e');
      return Future.value(isDarkModeDefault);
    }
  }

  Future<void> setDarkMode(bool value) {
    log('🟪 PERFORMANCE (AppSettingsCache > setDarkMode)');

    try {
      return _sharedPreferences!.setBool(isDarkModeKey, value);
    } catch (e) {
      throw Exception('[❌ Error] in AppSettingsCache > setDarkMode : $e');
    }
  }

  Future<bool> getRTL() async {
    log('🟪 PERFORMANCE (AppSettingsCache > getRTL)');

    try {
      return _sharedPreferences!.getBool(isRTLKey) ?? isRTLDefault;
    } catch (e) {
      print('[⚠️ Warring] in AppSettingsCache > getRTL : $e');
      return Future.value(isRTLDefault);
    }
  }

  Future<void> setRTL(bool value) {
    log('🟪 PERFORMANCE (AppSettingsCache > setRTL)');

    try {
      return _sharedPreferences!.setBool(isRTLKey, value);
    } catch (e) {
      throw Exception('[❌ Error] in AppSettingsCache > setRTL : $e');
    }
  }

  Future<String> getAppLanguage() {
    log('🟪 PERFORMANCE (AppSettingsCache > getAppLanguage)');

    try {
      String data = _sharedPreferences!.getString(selectedLanguageCodeKey) ??
          selectedLanguageCodeDefault;
      return Future.value(data);
    } catch (e) {
      print('[⚠️ Warring] in AppSettingsCache > getAppLanguage : $e');
      return Future.value(selectedLanguageCodeDefault);
    }
  }

  Future<void> setAppLanguage(String value) async {
    log('🟪 PERFORMANCE (AppSettingsCache > setAppLanguage)');

    try {
       await _sharedPreferences!.setString(selectedLanguageCodeKey, value);
       if(value == arLanguageCodeKey) {
         setRTL(true);
       }else {
         setRTL(false);
       }

    } catch (e) {
      throw Exception('[❌ Error] in AppSettingsCache > setAppLanguage : $e');
    }
  }
}
