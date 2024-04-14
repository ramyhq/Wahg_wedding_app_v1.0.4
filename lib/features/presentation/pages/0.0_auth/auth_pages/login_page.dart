import 'dart:developer';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/credentail/cubit/credential_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/forgot_password_page.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/register_page.dart';

import 'package:wahg_v1/features/presentation/pages/0.0_auth/constant.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/button_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/header_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/row_text_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/textfield_container_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/textfield_password_container_widget.dart';

import 'package:wahg_v1/features/presentation/pages/1_main_container.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/my_profile_page.dart';
import 'package:wahg_v1/theme/theme_helper.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            return Center(
                child: CircularProgressIndicator(
              color: appTheme.gold,
            ));
          }
          // if (credentailState is CredentialSuccess) {
          //   return BlocBuilder<AuthCubit, AuthState>(
          //       builder: (context, authSate) {
          //     if (authSate is AuthenticatedState) {
          //       return MyProfilePage();
          //     } else {
          //       return _loginBodyWidget(context);
          //     }
          //   });
          // }

          return _loginBodyWidget(context);
        },
      ),
    );
  }

  SingleChildScrollView _loginBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            HeaderWidget(title: "lbl_login".tr),
            TextFieldContainerWidget(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              prefixIcon: Icons.email,
              hintText: "lbl_email".tr,

            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldPasswordContainerWidget(
              keyboardType: TextInputType.emailAddress,
              controller: _passwordController,
              prefixIcon: Icons.lock,
              hintText: "lbl_password".tr,

            ),
            const SizedBox(
              height: 10,
            ),
            _forgotPasswordWidget(),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              title: "lbl_login".tr,
              onTap: _submitSignIn,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              title: "lbl_skip".tr,
              color: appTheme.blueGray900,
              onTap: _skipSignIn,
            ),
            const SizedBox(
              height: 10,
            ),
            RowTextWidget(
              title1: "msg_don_t_have_an_account".tr,
              title2: "  ${"lbl_register".tr}",
              onTap: () {
                Navigator.pushReplacementNamed(context, RegisterPage.id);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //_rowGoogleWidget(),
          ],
        ),
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Text(""),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordPage.id);
          },
          child: Text(
            "lbl_forgot_password".tr,
            style: TextStyle(
              color: appTheme.grayBlack,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }

  Widget _rowGoogleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<CredentialCubit>(context).submitGoogleAuth();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(
              EvaIcons.google,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _submitSignIn() {
    if (_emailController.text.isEmpty) {
      //
      Fluttertoast.showToast(
          msg: "msg_enter_your_email".tr,
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    if (_passwordController.text.isEmpty) {
      //
      Fluttertoast.showToast(
          msg: "msg_enter_your_password".tr,
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(
      user: NormalUser(
        uid: "no uid",
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _skipSignIn() {
    BlocProvider.of<CredentialCubit>(context).skipSignIn();
  }
}
