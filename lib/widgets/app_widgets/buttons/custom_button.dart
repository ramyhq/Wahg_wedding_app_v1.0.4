import 'package:flutter/material.dart';
import 'package:wahg_v1/utils/size_utils.dart';
 
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? 40.v,
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT14:
        return const EdgeInsets.only(
          top: 14,
          right: 14,
          bottom: 14,
        );
      case ButtonPadding.PaddingT4:
        return const EdgeInsets.only(
          top: 4,
          right: 4,
          bottom: 4,
        );
      case ButtonPadding.PaddingAll3:
        return  const EdgeInsets.all(3
        );
      case ButtonPadding.PaddingAll6:
        return const EdgeInsets.all(6
        );
      default:
        return const EdgeInsets.all( 14
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillDeeporangeA10033:
        return ColorConstant.deepOrangeA10033;
      case ButtonVariant.FillGray100:
        return ColorConstant.gray100;
      case ButtonVariant.FillLightblue100:
        return ColorConstant.lightBlue100;
      case ButtonVariant.FillRed200:
        return ColorConstant.red200;
      case ButtonVariant.FillGreenA100:
        return ColorConstant.greenA100;
      case ButtonVariant.OutlineBlueA700:
      case ButtonVariant.OutlineBlueA700_1:
        return null;
      default:
        return ColorConstant.blueA700;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineBlueA700:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: 1.h,
        );
      case ButtonVariant.OutlineBlueA700_1:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: 1.h,
        );
      case ButtonVariant.FillBlueA700:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillDeeporangeA10033:
      case ButtonVariant.FillGray100:
      case ButtonVariant.FillLightblue100:
      case ButtonVariant.FillRed200:
      case ButtonVariant.FillGreenA100:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(6.h
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.GilroySemiBold12:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: 12.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.GilroyMedium16BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: 16.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium12:
        return TextStyle(
          color: ColorConstant.deepOrange400,
          fontSize: 12.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium12Red700:
        return TextStyle(
          color: ColorConstant.red700,
          fontSize: 12.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterSemiBold10:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.GilroyMedium14:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: 14.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder6,
}

enum ButtonPadding {
  PaddingAll14,
  PaddingT14,
  PaddingT4,
  PaddingAll3,
  PaddingAll6,
}

enum ButtonVariant {
  FillBlueA700,
  FillWhiteA700,
  OutlineBlueA700,
  FillDeeporangeA10033,
  FillGray100,
  FillLightblue100,
  FillRed200,
  FillGreenA100,
  OutlineBlueA700_1,
}

enum ButtonFontStyle {
  GilroyMedium16,
  GilroySemiBold12,
  GilroyMedium16BlueA700,
  GilroyMedium12,
  GilroyMedium12Red700,
  InterSemiBold10,
  GilroyMedium14,
  GilroyMedium14WhiteA700,
}



class ColorConstant {
  static Color gray5001 = fromHex('#f8f9fa');

  static Color gray5002 = fromHex('#fafcff');

  static Color black900B2 = fromHex('#b2000000');

  static Color red700 = fromHex('#d03329');

  static Color blueGray50 = fromHex('#eaecf0');

  static Color blueA700 = fromHex('#0061ff');

  static Color lightBlue100 = fromHex('#b0e5fc');

  static Color red200 = fromHex('#fa9a9a');

  static Color blueA100 = fromHex('#80b0ff');

  static Color greenA100 = fromHex('#b5eacd');

  static Color black9003f = fromHex('#3f000000');

  static Color green600 = fromHex('#349765');

  static Color gray50 = fromHex('#f9fbff');

  static Color black900 = fromHex('#000000');

  static Color gray50001 = fromHex('#a6a6a6');

  static Color gray20001 = fromHex('#efefef');

  static Color blueGray700 = fromHex('#535763');

  static Color blueGray900 = fromHex('#262b35');

  static Color deepOrange400 = fromHex('#d58c48');

  static Color gray70011 = fromHex('#11555555');

  static Color blueGray200 = fromHex('#bac1ce');

  static Color gray500 = fromHex('#9e9e9e');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color blueGray400 = fromHex('#74839d');

  static Color blue700 = fromHex('#1976d2');

  static Color blue800 = fromHex('#0051d5');

  static Color blueGray300 = fromHex('#9ea8ba');

  static Color orangeA700 = fromHex('#ff6700');

  static Color blueGray600 = fromHex('#5f6c86');

  static Color gray900 = fromHex('#0d062d');

  static Color gray90001 = fromHex('#2a2a2a');

  static Color gray200 = fromHex('#ececec');

  static Color blue50 = fromHex('#e0ebff');

  static Color gray100 = fromHex('#fbf1f2');

  static Color deepPurple50 = fromHex('#ebe8f1');

  static Color deepOrangeA10033 = fromHex('#33dfa874');

  static Color blueGray1006c = fromHex('#6cd1d3d4');

  static Color blue200 = fromHex('#a6c8ff');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
