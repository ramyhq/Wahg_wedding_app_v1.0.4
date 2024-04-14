import 'package:flutter/material.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
 

class TextFieldContainerWidget extends StatelessWidget {
  const TextFieldContainerWidget({
    super.key,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
     this.decoration,
    this.hintText,
    this.borderRadius = 10,
    this.color,
    this.enabled = true,
    this.iconClickEvent,
  });

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
   final InputDecoration? decoration;
  final String? hintText;
  final double? borderRadius;
  final Color? color;
  final bool enabled;
  final VoidCallback? iconClickEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
        color: color ?? appTheme.grayBlack.withOpacity(.2),
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        enabled: enabled,
        decoration: decoration ?? InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: InkWell(
            onTap: iconClickEvent,
            child: Icon(prefixIcon!),
          ),
        ),
      ),
    );
  }
}
