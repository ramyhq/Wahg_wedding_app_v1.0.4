import 'package:flutter/material.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.enabled = true,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator,
      this.onChanged,
      });

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;
  bool? enabled;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(enabled: enabled ,
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),

    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.GilroyMedium16:
        return TextStyle(
          color: appTheme.blueGray900,
          fontSize: 16.adaptSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.GilroyMedium16BlueA700:
        return TextStyle(
          color: appTheme.blueA700,
          fontSize: 16.adaptSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.GilroySemiBold14:
        return TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14..adaptSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: appTheme.blueGray900,
          fontSize: 16.adaptSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.CircleBorder16:
        return BorderRadius.circular(
          16.h,
        );
      default:
        return BorderRadius.circular(
          6.h,
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineBluegray100:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: appTheme.blueGray900,
          ),
        );
      case TextFormFieldVariant.FillBlue50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack9003f:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: appTheme.blueGray900,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.FillBlue50:
        return appTheme.gold;
      case TextFormFieldVariant.OutlineBlack9003f:
        return appTheme.whiteA700;
      default:
        return appTheme.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineBluegray100:
        return false;
      case TextFormFieldVariant.FillBlue50:
        return true;
      case TextFormFieldVariant.OutlineBlack9003f:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT12:
        return const EdgeInsets.only(
          left: 12,
          top: 12,
          bottom: 12,
        );
      case TextFormFieldPadding.PaddingAll8:
        return const EdgeInsets.all(8);
      case TextFormFieldPadding.PaddingT6:
        return const EdgeInsets.only(
          top: 6,
          right: 6,
          bottom: 6,
        );
      default:
        return const EdgeInsets.all(11);
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder6,
  CircleBorder16,
}

enum TextFormFieldPadding {
  PaddingAll11,
  PaddingT12,
  PaddingAll8,
  PaddingT6,
}

enum TextFormFieldVariant {
  None,
  OutlineBluegray100,
  UnderLineBluegray100,
  FillBlue50,
  OutlineBlack9003f,
}

enum TextFormFieldFontStyle {
  GilroyMedium16Bluegray200,
  GilroyMedium16,
  GilroyMedium16BlueA700,
  GilroySemiBold14,
}
