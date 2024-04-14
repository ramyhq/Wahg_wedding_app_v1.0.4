import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/features/presentation/fragment/home_fragment.dart';
import 'package:wahg_v1/features/presentation/fragment/jobs_fragment.dart';
import 'package:wahg_v1/features/presentation/fragment/offers_fragment.dart';
import 'package:wahg_v1/features/presentation/pages/0_splash_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/halls_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/offers_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/my_profile_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/user_setting_page.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_bottom_bar.dart';

class HPDash extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String id = 'hp_dash';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Navigator(
          key: navigatorKey,
          initialRoute: HomeFragment.id,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) =>
                  getCurrentPage(context, routeSetting.name!),
              transitionDuration: const Duration(seconds: 0))),
      bottomNavigationBar: _buildBottomBarSection(context),
    ));
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return HomeFragment.id;
      case BottomBarEnum.Profile:
        return ProfilePage.id;

      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case HomeFragment.id:
        return HomeFragment();
      case ProfilePage.id:
        return ProfilePage();

      default:
        return DefaultWidget();
    }
  }
}
