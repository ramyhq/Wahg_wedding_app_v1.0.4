import 'package:flutter/material.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.color,
    this.addShadow = false,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;
  final Color? color;
  final bool addShadow;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: color?? appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(18.h),
                  boxShadow: addShadow ? [
                    BoxShadow(
                      color: appTheme.lime90026,
                      spreadRadius: 2.h,
                      blurRadius: 5.h,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    ),
                  ]: null,
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );


}
