import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wahg_v1/const/app_colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
//    backgroundColor: AppColors.lightBG,
    scaffoldBackgroundColor: AppColors.lightBG,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue, backgroundColor: AppColors.lightBG)
        .copyWith(secondary: AppColors.lightBG),

    fontFamily: 'IBMPlexSans',
    // textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
    dividerColor: AppColors.darkBG,
    appBarTheme: AppBarTheme(
      color: AppColors.primary,
      elevation: 0,
      foregroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleSpacing: 0.0,
      titleTextStyle: TextTheme(
        // appBar text style
        headline6: GoogleFonts.cairo(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        // Side text style
      ).headline6,
      toolbarTextStyle: TextTheme(
        headline6: GoogleFonts.cairoPlay(
          color: AppColors.darkBG,
          fontStyle: FontStyle.normal,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyText2,
    ),
    // tabBarTheme: TabBarTheme(
    //   indicator: UnderlineTabIndicator(
    //       borderSide: BorderSide(color: APPBAR_COLOR)),
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'IBMPlexSans',
    brightness: Brightness.dark,
    backgroundColor: AppColors.darkBG,
    primaryColor: AppColors.darkPrimary,
    dividerColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.darkBG,
    appBarTheme: AppBarTheme(
      color: AppColors.darkPrimary,
    ),
  );
}

//////////////////////////////////

final ThemeData kLightTheme = _buildLightTheme();
final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(brightness: Brightness.light, textTheme: textThemeLight);
}

ThemeData _buildDarkTheme() {
  return ThemeData(brightness: Brightness.dark, textTheme: textThemeDark);
}



final TextTheme textThemeLight =
GoogleFonts.latoTextTheme(ThemeData.light().textTheme).copyWith(
  headlineMedium: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: Colors.black,
  ),
  // subtitle2: TextStyle(
  //   color: HexColor.fromHex(ColorConstants.primaryColor),
  // ),
);

final TextTheme textThemeDark =
GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
  headlineMedium: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: Colors.white,
  ),
  // subtitle2: TextStyle(
  //   color: HexColor.fromHex(ColorConstants.primaryColor),
  // ),
);