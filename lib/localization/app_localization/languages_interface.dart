import 'package:flutter/material.dart';

//*
// This file will contain all viewed text on ui.
// And will get it depend on Language selection
//*

abstract class LanguageI {
  const LanguageI();

  static LanguageI of(BuildContext context) => Localizations.of<LanguageI>(context, LanguageI)!;

  /// Splash Text
  String get splashLogoText;
  String get splashLogoSubText;

  /// Material app
  String get materialAppTitle;

  // HomePage
  String get headerHomePage;




  // SnackBar
  String get getBabyNamesError;

  //Dialog
String get okActionDialog;
String get yourBabyNameIsDialog;

}
