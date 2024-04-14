import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _preferences;

  SharedPrefHelper(){
    // init();
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static const _LAST_CHECKED = "last_checked";
  static const _CHECK_INTERVAL = "check_interval";
  static const _DATA = "data";
  static const _THEME = "theme";

  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _preferences!.clear();
  }


  // Interval 600000 means handle cache for 600000 milliseconds or 10 minutes
  Future<bool> storeCache(String key, String json,
      { int? lastChecked, int interval = 600000}) {
    lastChecked ??= DateTime.now().millisecondsSinceEpoch;
    return _preferences!.setString(
        key,
        jsonEncode({
          _LAST_CHECKED: lastChecked,
          _CHECK_INTERVAL: interval,
          _DATA: json
        }));
  }

  Future<String?> getCache(String key) async {
    Map map = jsonDecode(_preferences?.getString(key)??'');
    // if outdated, clear and return null
    var lastChecked = map[_LAST_CHECKED];
    var interval = map[_CHECK_INTERVAL];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      _preferences?.remove(key);
      return null;
    }
    return map[_DATA];
  }

  Future<Map?> getFullCache(String key) async {
    Map map = jsonDecode(_preferences?.getString(key)??'');
    // if outdated, clear and return null
    var lastChecked = map[_LAST_CHECKED];
    var interval = map[_CHECK_INTERVAL];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      _preferences?.remove(key);
      return null;
    }
    return map;
  }

  Future saveValueDarkTheme(bool value) async {
    _preferences?.setBool(_THEME, value);
  }

  Future<bool> getValueDarkTheme() async {
    return _preferences?.getBool(_THEME) ?? false;
  }
}