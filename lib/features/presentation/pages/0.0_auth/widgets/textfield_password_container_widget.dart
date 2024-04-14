import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
 

class TextFieldPasswordContainerWidget extends StatefulWidget {
  const TextFieldPasswordContainerWidget({
    super.key,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.hintText,
  });

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? hintText;

  @override
  State<TextFieldPasswordContainerWidget> createState() =>
      _TextFieldPasswordContainerWidgetState();
}

class _TextFieldPasswordContainerWidgetState
    extends State<TextFieldPasswordContainerWidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: appTheme.grayBlack.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: isObscureText,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(isObscureText == true
                ? EvaIcons.eye
                : EvaIcons.eye),
          ),
        ),
      ),
    );
  }
}
