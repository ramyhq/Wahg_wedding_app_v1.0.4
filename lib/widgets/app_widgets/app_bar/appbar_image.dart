import 'package:flutter/material.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage(
      {required this.height,
      required this.width,
      this.imagePath,
      this.svgPath,
      this.padding,
      this.onTap});

  double height;

  double width;

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? padding;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: CustomImageView(
          //svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
