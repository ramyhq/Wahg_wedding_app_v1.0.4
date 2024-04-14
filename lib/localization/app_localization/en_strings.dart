
import 'package:wahg_v1/localization/app_localization/languages_interface.dart';

class LanguageEn extends LanguageI {
  const LanguageEn();

  /// Splash Text
  @override
  String get splashLogoText => 'Wahg';
  @override
  String get splashLogoSubText => 'Version';

  /// Material app

  @override
  String get materialAppTitle => 'Wahg';

  /// HomePage
  @override
  String get headerHomePage => 'Welcome';



  // SnackBar
  @override
  String get getBabyNamesError => 'Could not get baby name .. check internet';

  // Dialog
  @override
  String get okActionDialog => 'Ok';
  @override
  String get yourBabyNameIsDialog => 'Your Baby name is';

}
