import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';





Widget svAppButton({required String text, required Function onTap, double? width, required BuildContext context}) {
  return AppButton(
    shapeBorder: RoundedRectangleBorder(borderRadius: radius(12)),
    text: text,
    textStyle: boldTextStyle(color: Colors.white),
    onTap: onTap,
    elevation: 0,
    color: AppColors.primary,
    width: width ?? context.width() - 32,
    height: 56,
  );
}



void ShowShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    backgroundColor: context.cardColor,
    shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
    builder: (context) {
      return Text('Hi');
    },
  );
}

Widget CommonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return CommonCachedNetworkImage(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}



Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return  Placeholder().cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget placeHolderWidgetOld({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('assets/images/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
