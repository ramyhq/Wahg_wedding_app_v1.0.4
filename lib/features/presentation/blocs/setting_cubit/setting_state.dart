part of 'setting_cubit.dart';

class SettingState extends Equatable {
  // Here will add app settings like (Theme, Language, ... )

  String themeType;
  ThemeData? appTheme;
  bool isDarkMode;
  String appLanguageCode;
  Locale appLanguageLocale;
  LanguageI appStrings;
  bool isRTL;

  SettingState({
    this.themeType = themeDataDefault ,
    this.appTheme,
    this.appLanguageCode = defaultLanguageKey,
    this.isDarkMode = isDarkModeDefault,
    this.appLanguageLocale = appLanguageLocaleDefault,
    this.appStrings = appStringsDefault,
    this.isRTL = isRTLDefault,
  });

  @override
  List<Object?> get props =>
      [appTheme,themeType, appLanguageCode, appLanguageLocale, appStrings];

  SettingState copyWith({
    String? themeType,
    ThemeData? appTheme,
    bool? isDarkMode,
    String? appLanguageCode,
    Locale? appLanguageLocale,
    LanguageI? appStrings,
    bool? isRTL,
  }) {
    return SettingState(
      themeType: themeType ?? this.themeType,
      appTheme: appTheme ?? this.appTheme,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      appLanguageCode: appLanguageCode ?? this.appLanguageCode,
      appLanguageLocale: appLanguageLocale ?? this.appLanguageLocale,
      appStrings: appStrings ?? this.appStrings,
      isRTL: isRTL ?? this.isRTL,
    );
  }
}
