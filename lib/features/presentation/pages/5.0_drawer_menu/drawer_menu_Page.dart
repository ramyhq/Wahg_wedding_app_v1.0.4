import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/commons/network/url_helper.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_button.dart';
import 'package:wahg_v1/widgets/app_widgets/text_field/custom_text_form_field.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

import 'bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DrawerMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 310.h,
      padding: const EdgeInsets.all(24),
      decoration: AppDecoration.fillGoldWhite,
      child: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          height: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  String username = "-";
                  String email = "-";

                  if (state is UserLoaded) {
                    username = state.user.name!;
                    email = state.user.email!;
                   }
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 62,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageAsset.img8148x48,
                          height: 48.adaptSize,
                          width: 48.adaptSize,
                          radius: BorderRadius.circular(
                            24.h,
                          ),
                        ),
                        Container(
                          width: 139.h,
                          margin: const EdgeInsets.only(
                            left: 12,
                            top: 4,
                            bottom: 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(username,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.homeWelcomeBtnText
                                    .copyWith(color: appTheme.grayBlack),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                child: Text(email,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .hallsCardListLocationText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 22),
              Divider(
                height: 2.v,
                thickness: 2.v,
                color: ColorConstant.blueGray1006c,
              ),

              // // Calender
              // Container(
              //   margin: const EdgeInsets.only(
              //     top: 22,
              //   ),
              //   padding: const EdgeInsets.only(
              //     left: 12,
              //     right: 12,
              //     top: 13,
              //   ),
              //   decoration: AppDecoration.fillGoldWhite.copyWith(
              //     borderRadius: BorderRadiusStyle.roundedBorder6,
              //   ),
              //   child: Row(
              //     children: [
              //       CustomImageView(
              //         imagePath: ImageAsset.imgCalendar,
              //         height: 24.adaptSize,
              //         width: 24.adaptSize,
              //         color: appTheme.blueGray900,
              //         enableColorFilter: true
              //         ,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //           left: 6,
              //           top: 1,
              //           bottom: 2,
              //         ),
              //         child: Text(
              //           "lbl_calendar".tr,
              //           overflow: TextOverflow.ellipsis,
              //           textAlign: TextAlign.left,
              //           style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
              //         ),
              //       ),
              //       const Spacer(),
              //
              //     ],
              //   ),
              // ),
              // // Offers
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 12,
              //     right: 12,
              //     top: 34,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CustomImageView(
              //         imagePath: ImageAsset.imgSettings1,
              //         height: 24.adaptSize,
              //         width: 24.adaptSize,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //           left: 6,
              //           top: 1,
              //           bottom: 2,
              //         ),
              //         child: Text(
              //           "lbl_offers".tr,
              //           overflow: TextOverflow.ellipsis,
              //           textAlign: TextAlign.left,
              //           style:
              //               CustomTextStyles.txtGilroySemiBold16Bluegray700,
              //         ),
              //       ),
              //       const Spacer(),
              //
              //     ],
              //   ),
              // ),
// logout
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 34,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.login),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 2,
                        bottom: 1,
                      ),
                      child: Text(
                        "lbl_logout".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                  ],
                ).onTap(() {
                  BlocProvider.of<AuthCubit>(context).loggedOut();
                }),
              ),
              const Spacer(),
              Divider(
                height: 2.v,
                thickness: 2.v,
                color: ColorConstant.blueGray1006c,
              ),

              //Help
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 13,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.imgQuestion24x24,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                        top: 1,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_help".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                    const Spacer(),

                  ],
                ),
              ).onTap(() {
                URLHelper.launchInWebView(
                    Uri.parse('https://www.ifeps.net/p/contact-us.html'));
              }),

            ],
          ),
        ),
      ),
    );
  }
}
