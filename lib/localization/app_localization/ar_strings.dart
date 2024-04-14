
import 'package:wahg_v1/localization/app_localization/languages_interface.dart';

class LanguageAr extends LanguageI {
  const   LanguageAr();

  /// Splash
  @override
   String get splashLogoText => 'وهج' ;
  @override
  String get splashLogoSubText => 'نسخه' ;

  /// MaterialApp
  @override
  String get materialAppTitle => 'وهج';

  /// HomePage
  @override
  String get headerHomePage => 'مرحبا' ;










  // SnackBar
  @override
  String get getBabyNamesError => 'خطأ في الحصول الاسم .. تاكد من الانترنت' ;

  // Dialog
  @override
  String get okActionDialog => 'حسنا';
  @override
  String get yourBabyNameIsDialog => 'اسم طفلك هو';


}

