import 'package:flutter/material.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  /// Default Text
  static get smallBodyText1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.grayBlack.withOpacity(0.64),
      );

  // AppBar Title
  static get appBarWelcome => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.grayBlack,
      );

  // Home Page
  static get homeWelcomeBtnText => theme.textTheme.labelSmall!
      .copyWith(color: appTheme.goldWhite, fontSize: 16.fSize);

  static get homeSectionTitleText => theme.textTheme.labelLarge;

  static get categoryIconText => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
      );

  static get homeCardTitleText => theme.textTheme.headlineMedium!.copyWith(
        fontSize: 17.fSize,
      );
  static get homeCardDescriptionText =>
      theme.textTheme.headlineSmall!.copyWith();
  static get homeCardPriceText => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.red,
        fontSize: 17.fSize,
      );

  /// Halls List Page
  static get hallsCardListTitleText =>
      theme.textTheme.headlineMedium!.copyWith(height: 1.3);
  static get hallsCardListDesText =>
      theme.textTheme.headlineSmall!.copyWith(height: 1.3);
  static get hallsCardListPriceText => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.red,
      );
  static get hallsCardListLocationText =>
      theme.textTheme.headlineSmall!.copyWith(
        fontSize: 12.adaptSize,
        color: appTheme.grayBlack.withOpacity(0.64),
      );

  // HallsDetailsPage
  static get hallsDetailsTitleText =>
      theme.textTheme.headlineLarge!.copyWith(height: 1.3);
  static get hallsDetailsLocationText =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.grayBlack.withOpacity(0.64),
      );
  static get hallsDetailsPriceText => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.red,
      );

  static get hallsDetailsContactUsText =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.grayBlack.withOpacity(0.64),
      );
  static get hallsDetailsDesTitleText =>
      theme.textTheme.headlineSmall!.copyWith(
        height: 1.3,
        color: appTheme.grayBlack.withOpacity(0.64),
      );
  static get hallsDetailsDesText => theme.textTheme.headlineSmall!.copyWith(
        height: 1.3,
      );

  //// Jobs Fragment
  static get jobsCardListTitleText =>
      theme.textTheme.headlineMedium!.copyWith(height: 1.3);
  static get jobsCardListDesText =>
      theme.textTheme.headlineSmall!.copyWith(height: 1.3,
        color: appTheme.grayBlack.withOpacity(0.64),
      );
  static get jobsCardListPriceText => theme.textTheme.headlineMedium!.copyWith(
    color: appTheme.red,
  );
  static get jobsCardListLocationText =>
      theme.textTheme.headlineSmall!.copyWith(
        fontSize: 12.adaptSize,
        color: appTheme.grayBlack.withOpacity(0.64),
      );

  static get jobsCardListPostTimeText =>
      theme.textTheme.headlineSmall!.copyWith(
        fontSize: 12.adaptSize,
        color: appTheme.grayBlack.withOpacity(0.64),
      );
//////// Temp
  static get txtGilroySemiBold14Bluegray700 =>
      theme.textTheme.headlineSmall!.copyWith();
  static get txtGilroySemiBold16Bluegray700 =>
      theme.textTheme.headlineSmall!.copyWith(
        fontSize: 16.adaptSize,
      );

    static get txtGilroySemiBold16WhiteA700 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.whiteA700,

      );



  ////////////
  static get bodySmallGreen900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.green900,
      );
  static get bodySmallYellow900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.yellow900,
      );
  // Title text style
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
      );

  static get titleLarge22Pink => theme.textTheme.labelLarge!.copyWith(
        fontSize: 22.fSize,
      );
  static get titleLargeKantumruyWhiteA700 =>
      theme.textTheme.titleLarge!.kantumruy.copyWith(
        color: appTheme.whiteA700,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
      );

  static get txtGilroySemiBold12 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );
  static get txtGilroySemiBold16Bluegray900 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );

  static get txtGilroyRegular12Bluegray400 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get txtGilroyRegular12 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );
  static get txtGilroyBold20 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.yellow900,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
      );
  static get txtGilroyBold12 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );
  static get txtGilroyRegular14Gray500 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray200,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
}

extension on TextStyle {
  TextStyle get kantumruy {
    return copyWith(
      fontFamily: 'Kantumruy',
    );
  }

  TextStyle get dMSerifDisplay {
    return copyWith(
      fontFamily: 'DM Serif Display',
    );
  }

  TextStyle get comforter {
    return copyWith(
      fontFamily: 'Comforter',
    );
  }
}
