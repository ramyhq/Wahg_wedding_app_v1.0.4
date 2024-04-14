import 'package:flutter/material.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

// ignore: must_be_immutable
class JoJobTagWidget extends StatelessWidget {
  JoJobTagWidget(
    this.tag , {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  String? tag = 'Tag';
  bool isSelected = false;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 6.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        tag!,
        style: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 12.fSize,
          fontFamily: 'Kantumruy',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: (isSelected),
      backgroundColor: appTheme.gray100,
      selectedColor: appTheme.gray100,
      shape: ( isSelected )
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.blueGray900.withOpacity(0.6),
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
