import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/presentation/blocs/setting_cubit/setting_cubit.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/main.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:nb_utils/nb_utils.dart';

Future showBabyNameDialog(
  BuildContext context, {
  final GestureTapCallback? onTap,
  final List<Widget>? actions,
  var arguments,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      Timer(
        const Duration(seconds: 10),
        () {
          // TODO [VIP] later will go home after 20 Time Counter
          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      );
      final width = MediaQuery.of(context).size.width;
      return AlertDialog(
        scrollable: true,
        actions: actions,
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(top: 10, bottom: 10),
        // backgroundColor: context.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
        contentPadding:
            const EdgeInsets.only(top: 42, left: 8, right: 8, bottom: 4),
        content: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            width: width / 6 * 3,
            child: FittedBox(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    txt.yourBabyNameIsDialog,
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(size: 20),
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(60),
                        decoration: boxDecorationWithRoundedCorners(
                          boxShape: BoxShape.circle,
                          backgroundColor:
                              context.read<SettingCubit>().state.isDarkMode
                                  ? cardDarkColor
                                  : black,
                        ),
                      ),
                      CustomImageView(
                          imagePath: Img.get('tomato_logo.png'),
                          height: 60,
                          width: 60)
                      //const Icon(Icons.person, size: 50, color : white)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(arguments.name, style: boldTextStyle(size: 24)),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

