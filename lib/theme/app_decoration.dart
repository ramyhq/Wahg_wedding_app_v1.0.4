import 'package:flutter/material.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGoldWhite => BoxDecoration(
        color: appTheme.goldWhite,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
    color: appTheme.whiteA700,
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          4.94,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineGray200 => BoxDecoration(
    color: appTheme.gray100,
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
    ),
  );

  static BoxDecoration get cardDecoration => BoxDecoration(
    color:  themeIsDark ?Color(0XFF946900): appTheme.whiteA700,
    borderRadius:  BorderRadiusStyle.roundedBorder12,
    border: Border.all(
      color: appTheme.gray200,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: themeIsDark ? Colors.transparent: appTheme.black,
        spreadRadius: 2.h,
        blurRadius:4.h,
        offset: const Offset(
          0,
          2,
        ),
      ),
    ],
  );


  /////////
   static List<BoxShadow>? get getHPShadows => [
    BoxShadow(
      color: themeIsDark ? Colors.transparent: appTheme.black,
      spreadRadius: 1.h,
      blurRadius:2.h,
      offset: const Offset(
        0,
        2,
      ),
    ),
  ];



}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
    6.h,
  );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
