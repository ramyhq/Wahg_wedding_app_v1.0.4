import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/utils/validation_functions.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_title.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/custom_app_bar.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_button.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_icon_button.dart';
import 'package:wahg_v1/widgets/app_widgets/text_field/custom_text_form_field.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:wahg_v1/localization/app_localization.dart';

class MyProfilePage extends StatefulWidget {
  static const String id = "my_profile_page";

  MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController? firstNameController;

  TextEditingController? mobileNumberController;

  TextEditingController? emailController;

  @override
  void dispose() {
    firstNameController!.dispose();
    emailController!.dispose();
    mobileNumberController!.dispose();
    super.dispose();
  }

  CustomAppBar MyProfileAppBar() {
    return CustomAppBar(
      height: 53.v,
      leadingWidth: 40,
      centerTitle: true,
      leading: CustomImageView(
          height: 24.adaptSize,
          width: 24.adaptSize,
          imagePath: ImageAsset.imgArrowleft,
          padding: const EdgeInsets.only(left: 16, top: 13, bottom: 5),
          onTap: () {
            NavigationX.goBack();
          }),
      title: AppbarTitle(text: " "),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('0k9977 myProfile in Widget build(BuildContext context)');

    return SafeArea(
      child: Scaffold(
        appBar: MyProfileAppBar(),
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              print('0777 ${state.user}');
              BlocProvider.of<UserCubit>(context)
                  .getCurrentUser(state.user.uid);
              firstNameController =
                  TextEditingController(text: state.user.name);
              emailController = TextEditingController(text: state.user.email);
              mobileNumberController =
                  TextEditingController(text: state.user.phoneNumber);

              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 24,
                      right: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 150.adaptSize,
                            width: 150.adaptSize,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      ImageAsset.imgMyProfileDefaultImage,
                                  height: 150.adaptSize,
                                  width: 150.adaptSize,
                                  radius: BorderRadius.circular(
                                    75.h,
                                  ),
                                  alignment: Alignment.center,
                                ),
                                // CustomIconButton(
                                //   height: 30,
                                //   width: 30,
                                //   padding: const EdgeInsets.only(
                                //     top: 5,
                                //     right: 2,
                                //   ),
                                //   alignment: Alignment.topRight,
                                //   child: CustomImageView(
                                //     imagePath: ImageAsset.imgPending,
                                //   ),
                                // ),
                                CustomIconButton(
                                    height: 30,
                                    width: 30,
                                    color: appTheme.gold,
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.topRight,
                                    child: CustomImageView(
                                        imagePath: ImageAsset.imgIconEdit))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 26,
                          ),
                          child: Text(
                            "lbl_first_name".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                CustomTextStyles.txtGilroySemiBold16Bluegray700,
                          ),
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: firstNameController,
                          hintText: "msg_enter_first_name".tr,
                          margin: const EdgeInsets.only(
                            top: 8,
                          ),
                          validator: (value) {
                            if (!isText(value)) {
                              return "Please enter valid text";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            firstNameController!.text = val;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 18,
                          ),
                          child: Text(
                            "lbl_email_id".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                CustomTextStyles.txtGilroySemiBold16Bluegray700,
                          ),
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: emailController,
                          hintText: "msg_enter_email_id".tr,
                          margin: const EdgeInsets.only(
                            top: 8,
                          ),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            emailController!.text = val;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 18,
                          ),
                          child: Text(
                            "lbl_mobile_number".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                CustomTextStyles.txtGilroySemiBold16Bluegray700,
                          ),
                        ),
                        CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: mobileNumberController,
                          hintText: "msg_enter_mobile_number".tr,
                          margin: const EdgeInsets.only(
                            top: 8,
                          ),
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (!isValidPhone(value)) {
                              return "Please enter valid phone number";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            mobileNumberController!.text = val;
                          },
                        ),
                        CustomButton(
                          height: 50.v,
                          text: "lbl_update".tr,
                          margin: const EdgeInsets.only(
                            top: 24,
                            bottom: 5,
                          ),
                          onTap: () async {
                            print('val ${mobileNumberController!.text}');

                            await BlocProvider.of<UserCubit>(context)
                                .updateUser(
                                    user: NormalUser(
                              uid: state.user.uid,
                              name: firstNameController!.text,
                              email: emailController!.text,
                              phoneNumber: mobileNumberController!.text,
                            ));

                            if (context.mounted) {
                              BlocProvider.of<UserCubit>(context)
                                  .getCurrentUser(state.user.uid);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else
              return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
