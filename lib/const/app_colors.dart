import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF1976D2);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF1E88E5);

//Backgrounds colors
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = const Color(0xff212121);

//Text Colors
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = const Color(0xff16161C);

  static Color transparent = const Color(0x00000000);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xffffffff);

  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xFF1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);

   static Color red = Colors.red;
  static Color yellow = Colors.yellow;
  static Color orange = Colors.orange;
  static Color green = Colors.green;


// Light Theme Colors
  static const appColorPrimary = Color(0xFF5685EC);
  static const appTextColorPrimary = Color(0xFF212121);
  static const iconColorPrimary = Color(0xFFFFFFFF);
  static const appTextColorSecondary = Color(0xFF5A5C5E);
  static const iconColorSecondary = Color(0xFFA8ABAD);
  static const appLayout_background = Color(0xFFf8f8f8);
  static const appLight_purple = Color(0xFFdee1ff);
  static const appLight_orange = Color(0xFFffddd5);
  static const appLight_parrot_green = Color(0xFFb4ef93);
  static const appIconTintCherry = Color(0xFFffddd5);
  static const appIconTint_sky_blue = Color(0xFF73d8d4);
  static const appIconTint_mustard_yellow = Color(0xFFffc980);
  static const appIconTintDark_purple = Color(0xFF8998ff);
  static const appTxtTintDark_purple = Color(0xFF515BBE);
  static const appIconTintDarkCherry = Color(0xFFf2866c);
  static const appIconTintDark_sky_blue = Color(0xFF73d8d4);
  static const appDark_parrot_green = Color(0xFF5BC136);
  static const appDarkRed = Color(0xFFF06263);
  static const appLightRed = Color(0xFFF89B9D);
  static const appCat1 = Color(0xFF8998FE);
  static const appCat2 = Color(0xFFFF9781);
  static const appCat3 = Color(0xFF73D7D3);
   static const appCat4 = Color(0xFF87CEFA);
   static const appShadowColor = Color(0x95E9EBF0);
   static const appColorPrimaryLight = Color(0xFFF9FAFF);
   static const appSecondaryBackgroundColor = Color(0xff343434);
   static const appDividerColor = Color(0xFFDADADA);
   static const appSplashSecondaryColor = Color(0xFFD7DBDD);

// Dark Theme Colors
  static const appBackgroundColorDark = Color(0xFF262626);
  static const cardBackgroundBlackDark = Color(0xFF1F1F1F);
  static const color_primary_black = Color(0xFF131d25);
  static const appColorPrimaryDarkLight = Color(0xFFF9FAFF);
  static const iconColorPrimaryDark = Color(0xFF212121);
  static const iconColorSecondaryDark = Color(0xFFA8ABAD);
  static const appShadowColorDark = Color(0x1A3E3942);



  static Color getColorCircleProgress(double s) {
    Color r = AppColors.red;
    if (s > 4.5 && s < 7) {
      r = AppColors.yellow;
    } else if (s >= 7) {
      r = AppColors.green;
    }
    return r;
  }
}
