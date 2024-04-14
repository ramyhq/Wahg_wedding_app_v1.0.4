import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/di/injection_container.dart' as di;
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/presentation/blocs/setting_cubit/setting_cubit.dart';
import 'package:wahg_v1/features/presentation/fragment/home_fragment.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/credentail/cubit/credential_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';

import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/login_page.dart';
import 'package:wahg_v1/features/presentation/pages/1_main_container.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/user_setting_page.dart';
import 'package:wahg_v1/main.dart';
import 'package:nb_utils/nb_utils.dart';

Widget builder(BuildContext context) {
  return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthenticatedState)  {
        if(state.isAnonymous == false){
          BlocProvider.of<UserCubit>(context).getCurrentUser(state.uid);
        }
      }
      },
    builder: (context, authState) {

      if (authState is AuthenticatedState)  {
        return HPDash();
      } else {
        return const LoginPage();
      }
    },
  );
}

class SplashPage extends StatefulWidget {
  static const String id = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
   }

  void afterBuildCreated(Function()? onCreated) {
    makeNullable(SchedulerBinding.instance)!
        .addPostFrameCallback((_) => onCreated?.call());
  }

  @override
  void initState() {
    super.initState();
    //startTime();
  }

  @override
  Widget build(BuildContext context) {
    log('🟪 PERFORMANCE (SplashPage )');

    return Scaffold(
      body: builder(context),
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 250,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 300,
              height: 350,
              child: Image.asset(Img.get('wahg_logo.png'), fit: BoxFit.cover),
            ),
            const SizedBox(height: 2),
            Container(
              height: 5,
              width: 80,
              child: LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.darkPrimary),
                backgroundColor: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
