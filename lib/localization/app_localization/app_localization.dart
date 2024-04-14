import 'package:flutter/material.dart';
import 'package:wahg_v1/localization/app_localization/ar_strings.dart';
import 'package:wahg_v1/localization/app_localization/en_strings.dart';
import 'package:wahg_v1/localization/app_localization/languages_interface.dart';

import 'package:nb_utils/nb_utils.dart';

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: 'images/flag/ic_ar.png'),
  ];
}

class AppLocalizations extends LocalizationsDelegate<LanguageI> {
  const AppLocalizations();

  @override
  Future<LanguageI> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return const LanguageEn();
      case 'ar':
        return const LanguageAr();

      default:
        return const LanguageEn();
    }
  }

  @override
  bool isSupported(Locale locale) => LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<LanguageI> old) => false;
}
