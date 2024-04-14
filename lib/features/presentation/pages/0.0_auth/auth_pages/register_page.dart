import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/credentail/cubit/credential_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/login_page.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/constant.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/button_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/header_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/row_text_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/textfield_container_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/textfield_password_container_widget.dart';

 
import 'package:wahg_v1/features/presentation/pages/1_main_container.dart';
import 'package:wahg_v1/theme/theme_helper.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController(text: "");
  final TextEditingController _genderController = TextEditingController();

  DateTime _userBirthday = DateTime(1800, 01), _userSignupDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        helpText: 'msg_Select_your_birthday'.tr,
        // cancelText: 'Not Now',
        confirmText: "lbl_ok".tr ,
        fieldLabelText: 'lbl_birthday_date'.tr ,
        fieldHintText: 'lbl_Month_Date_Year'.tr,
        errorFormatText: 'msg_Enter_valid_date'.tr ,
        errorInvalidText: 'msg_Enter_date_in_valid_range'.tr ,
        context: context,
        builder: (BuildContext context, Widget? child) {
          return child!;
        },
        initialDate: DateTime(2000, 01),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2023));
    if (picked != null) {
      setState(() {
        _userBirthday = picked;
        (_userBirthday == DateTime(1800, 01))
            ? ''
            : _dobController.text = picked.toString().split(' ')[0];
        print(_userBirthday);
      });
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _dobController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentailState) {

          if (credentailState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }

          if (credentailState is CredentialFailure) {
            //fix snakbar
            log('Invalid Email Password: ');
          }
        },
        builder: (context, credentailState) {
          if (credentailState is CredentialLoading) {
            return  Center(child: CircularProgressIndicator(color: appTheme.gold,));
          }

          if (credentailState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authSate) {
              if (authSate is AuthenticatedState) {

                return HPDash(
                 );
              } else {
                return _bodyWidget();
              }
            });
          }

          return _bodyWidget();
        },
      ),
    );
  }

  SingleChildScrollView _bodyWidget() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            HeaderWidget(title: "lbl_register".tr),
            // const SizedBox(
            //   height: 10,
            // ),
            _profileWidget(),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.text,
              prefixIcon: Icons.person,
              controller: _usernameController,
              hintText: "lbl_user_name".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.text,
              prefixIcon: Icons.email,
              controller: _emailController,
              hintText: "lbl_email".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              indent: 120,
              endIndent: 120,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldPasswordContainerWidget(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: "lbl_password".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldPasswordContainerWidget(
              controller: _passwordAgainController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.lock,
              hintText: "lbl_password_again".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            // TextFormField(
            //   controller: _dobController,
            //   enabled: false,
            //   validator: (value) => (_userBirthday == DateTime(1800, 01))
            //       ? 'Select your Birthday'
            //       : null,
            // ).onTap(() {
            //   return _selectDate(context);
            // }),
            TextFieldContainerWidget(
              controller: _dobController,
              enabled: false,
              keyboardType: TextInputType.datetime,

              prefixIcon: Icons.calendar_month,
              hintText: "msg_enter_your_birthday".tr,
            ).onTap(() {
              return _selectDate(context);
            }),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              keyboardType: TextInputType.text,
              prefixIcon: Icons.email,
              controller: _genderController,
              hintText: "lbl_gender".tr,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              indent: 120,
              endIndent: 120,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              title: 'lbl_register'.tr,
              onTap: () {
                _submitSignUp();
              },
            ),
            const SizedBox(
              height: 10,
            ),

            RowTextWidget(
              title1: "msg_do_you_have_already_an_account".tr,
              title2: "lbl_login".tr,
              mainAxisAlignment: MainAxisAlignment.center,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.id, (route) => false);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _rowDataWidget(),
          ],
        ),
      ),
    );
  }

  Widget _profileWidget() {
    return Column(
      children: [
        // Container(
        //   height: 62,
        //   width: 62,
        //   decoration: const BoxDecoration(
        //     color: Colors.grey,
        //     shape: BoxShape.circle,
        //   ),
        //   child: Image.asset(
        //     "assets/images/profile_default.png",
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // const SizedBox(
        //   height: 12,
        // ),
        Text(
          "lbl_create_your_profile".tr,
          style: TextStyle(
            color: appTheme.grayBlack,
            fontSize: 16,
          ),
        ),

      ],
    );
  }

  Widget _rowDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'msg_by_clicking_register_you_agree_to_the'.tr,
          style: TextStyle(
            color: appTheme.grayBlack,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
          Text(
          'lbl_privacy_policy'.tr,
          style: TextStyle(
            color: appTheme.gold,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  void _submitSignUp() {
    if (_usernameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter your name",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (_emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter your email",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (_passwordController.text == _passwordAgainController.text) {
    } else {
      Fluttertoast.showToast(
          msg: "Both password must be same...",
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: NormalUser(
          uid: "no uid",
      name: _usernameController.text,
      email: _emailController.text,
      password: _passwordAgainController.text,
      isOnline: false,
      status: "",
      profileUrl: "",
      phoneNumber: "",
      dob: _dobController.text.isEmpty ? DateTime.parse("2000-01-01T00:00:00.000Z") : DateTime.parse(_dobController.text),
     //  dob: _dobController.text.isEmpty ? "" : _dobController.text,
      gender: _genderController.text.isEmpty ? "" : _genderController.text,
    ));
  }
}
