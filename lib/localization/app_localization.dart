import 'package:wahg_v1/localization/app_localization/ar_strings.dart';
import 'package:wahg_v1/localization/app_localization/languages_interface.dart';
import 'package:wahg_v1/localization/ar_eg/ar_eg_translations.dart';
import 'package:wahg_v1/routing/navigationx.dart';

import 'en_us/en_us_translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

LanguageI txt = const LanguageAr();

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': enUs,
    'ar':arEg,
  };

  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
        NavigationX.navigatorKey.currentContext!, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  //Returning a SynchronousFuture here because an async "load" operation
  //cause an async "load" operation
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

extension LocalizationExtension on String {
  String get tr => AppLocalization.of().getString(this);
}
