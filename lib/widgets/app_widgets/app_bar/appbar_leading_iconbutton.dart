import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_icon_button.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          addShadow:true,
          height: 36.adaptSize,
          width: 36.adaptSize,
          child: CustomImageView(
            imagePath: ImageAsset.imgMegaphone,
          ),
        ),
      ),
    );
  }
}
