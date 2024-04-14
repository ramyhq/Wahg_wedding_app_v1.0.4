import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/commons/network/url_helper.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/login_page.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/button_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0_splash_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/language_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/my_profile_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/themes_page.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_image.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_title.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/custom_app_bar.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_icon_button.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:wahg_v1/localization/app_localization.dart';

class ProfilePage extends StatefulWidget {
  static const String id = "profile_page";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        buildWhen: (previous, current) {
      return previous != current;
    }, builder: (context, state) {
      String username = "-";
      String email = "-";

      if (state is UserLoaded) {
        username = state.user.name!;
        email = state.user.email!;
        return LoggedInUserSetting(username, email);
      } else {
        return NotLoggedInUserSetting(username: username, email: email);
      }
    });
  }

  SafeArea LoggedInUserSetting(String username, String email) {
    return SafeArea(
        child: Scaffold(
             body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                      left: 16, top: 31, right: 16, bottom: 31),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 150.adaptSize,
                            width: 150.adaptSize,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              CustomImageView(
                                  imagePath:
                                      ImageAsset.imgMyProfileDefaultImage,
                                  height: 150.adaptSize,
                                  width: 150.adaptSize,
                                  radius: BorderRadius.circular(75.h),
                                  alignment: Alignment.center),

                            ])),
                        Padding(
                            padding: const EdgeInsets.only(top: 19),
                            child: Text(username,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.hallsDetailsDesText)),
                        Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Text(email,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.hallsDetailsDesText)),
                        Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageAsset.imgMyProfile,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 1),
                                      child: Text("lbl_my_profile".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .hallsDetailsDesText)),
                                  const Spacer(),
                                  CustomImageView(
                                      imagePath: ImageAsset.imgArrowRight,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)
                                ])).onTap(() {
                          // Navigator.of(context).pushNamed(MyProfilePage.id);
                          NavigationX.pushNamed(MyProfilePage.id);
                        }),
                        Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageAsset.imgChangeLanguage,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      padding: const EdgeInsets.only(bottom: 1)),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 3),
                                      child: Text("lbl_language".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .hallsDetailsDesText)),
                                  const Spacer(),
                                  CustomImageView(
                                      imagePath: ImageAsset.imgArrowRight,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      padding: const EdgeInsets.only(bottom: 1))
                                ])).onTap(() {
                          // Navigator.of(context).pushNamed(MyProfilePage.id);
                          NavigationX.pushNamed(LanguagePage.id);
                        }),
                        Padding(
                            padding: const EdgeInsets.only(top: 28),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageAsset.imgTheme1,
                                      height: (24.adaptSize),
                                      width: (24.adaptSize)),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 1),
                                      child: Text("lbl_theme".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .hallsDetailsDesText)),
                                  const Spacer(),
                                  CustomImageView(
                                      imagePath: ImageAsset.imgArrowRight,
                                      height: (24.adaptSize),
                                      width: (24.adaptSize))
                                ])).onTap(() {
                          // Navigator.of(context).pushNamed(MyProfilePage.id);
                          NavigationX.pushNamed(ThemePage.id);
                        }),
                        Padding(
                            padding: const EdgeInsets.only(top: 29, bottom: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageAsset.imgHelpDark,
                                      height: (24.adaptSize),
                                      width: (24.adaptSize)),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 2),
                                      child: Text("msg_help_and_feedback".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .hallsDetailsDesText)),
                                  const Spacer(),
                                  CustomImageView(
                                      imagePath: ImageAsset.imgArrowRight,
                                      height: (24.adaptSize),
                                      width: (24.adaptSize))
                                ])).onTap(() {
                          URLHelper.launchInWebView(
                              Uri.parse('https://www.ifeps.net/p/contact-us.html'));
                        })
                      ])),
            )));
  }


}

class NotLoggedInUserSetting extends StatelessWidget {
  const NotLoggedInUserSetting({
    super.key,
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                    left: 16, top: 31, right: 16, bottom: 31),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 150.adaptSize,
                            width: 150.adaptSize,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              CustomImageView(
                                  imagePath:
                                      ImageAsset.imgMyProfileDefaultImage,
                                  height: 150.adaptSize,
                                  width: 150.adaptSize,
                                  radius: BorderRadius.circular(75.h),
                                  alignment: Alignment.center),
                            ])),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Text(
                                'msg_You_need_to_login_to_use_this_page'.tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.hallsDetailsDesText
                                    .copyWith(
                                  fontSize: 16.fSize,
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          title: "Login",
                          onTap: () {
                            NavigationX.pushNamedAndRemoveUntil(SplashPage.id);
                          },
                        ),
                      ]),
                ))));
  }
}
