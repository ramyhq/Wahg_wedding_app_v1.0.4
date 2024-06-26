import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/utils/size_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = sl<AppSettingsCache>().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'light': PrimaryColors(),
    'dark': PrimaryColors(),
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'light': ColorSchemes.lightColorScheme,
    'dark': ColorSchemes.darkColorScheme
  };

  /// Returns the light colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightColorScheme;
    return ThemeData(
      useMaterial3: false,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.lightTextTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.goldWhite,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.h),
              topRight: Radius.circular(0.h),
              bottomLeft: Radius.circular(0.h),
              bottomRight: Radius.circular(12.h),
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the light colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme lightTextTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 16.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w900,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray900.withOpacity(0.56),
          fontSize: 12.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 48.fSize,
          fontFamily: 'Comforter',
          fontWeight: FontWeight.w800,
        ),
        displayMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 42.fSize,
          fontFamily: 'Comforter',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 36.fSize,
          fontFamily: 'Comforter',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 24.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 20.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'DM Serif Display',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 24.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w900,
        ),
        headlineMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 20.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 24.fSize,
          fontFamily: 'Kantumruy',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 20.fSize,
          fontFamily: 'Kantumruy',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'Kantumruy',
          fontWeight: FontWeight.w400,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightColorScheme = ColorScheme.light();
  static const darkColorScheme =  ColorScheme.dark();
}

/// Class containing custom colors for a light theme.
class PrimaryColors {
  // Black
  Color get black => const Color(0X0C000000);
  Color get black90019 => const Color(0X19000000);

  // BlueGray
  Color get blueGray900 => const Color(0XFF1E2742);

  // Gray
  Color get gray100 => const Color(0XFFFBF8F2);
  Color get gray200 => const Color(0XFFF0F0F0);

  // Green
  Color get green900 => const Color(0XFF008000);
// White
  Color get whiteA700 => const Color(0XFFFCFDFF);
  Color get whiteA70001 => const Color(0XFFFFFFFF);

  // Yellow
  Color get yellow900 => const Color(0XFFFE7A15);

  // Lime
  Color get lime700 => const Color(0XFFBFA054);
  Color get lime90026 => const Color(0X266F3000);

  // Figma Colors
  Color get red => const Color(0XFFff83a6);
  Color get gold => const Color(0XFFBFA054);
 Color get goldLight => const Color(0XFF1e2742);
 Color get goldWhite => const Color(0XFF04070d);
  Color get gray6 => const Color(0xFF090909);
  Color get grayDark => const Color(0xFF9EA1AB);
  Color get grayBlack => const Color(0xFFe1d8bd);

/// Temp Colors
    Color get blueA700 => const Color(0xFF0061ff);

}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
