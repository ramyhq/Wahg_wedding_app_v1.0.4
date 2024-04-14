import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_defaults.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/login_page.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/constant.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/button_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/header_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/row_text_widget.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/widgets/textfield_container_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String id = 'forget_password_page';

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: Column(
            children: [
              HeaderWidget(title: 'Forgot Password'),
              const SizedBox(height: 20),
              const Text(
                  "Don't worry! Just fill in your email and  ${appName} will send you a link to rest your passwrod."),
              const SizedBox(height: 20),
              TextFieldContainerWidget(
                controller: _emailController,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(title: 'Send Password, Reset Email'),
              const SizedBox(
                height: 20,
              ),
              RowTextWidget(
                title1: "Remember the account information? ",
                title2: "Login",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.id, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
