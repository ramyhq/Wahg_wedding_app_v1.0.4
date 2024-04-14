
import 'package:flutter/material.dart';
 
import 'package:wahg_v1/theme/theme_helper.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.title1,
    this.title2,
    this.onTap,
    this.mainAxisAlignment,
  });
  final String? title1;
  final String? title2;
  final VoidCallback? onTap;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return _rowTextWidget();
  }

  Widget _rowTextWidget() {
    return Row(
      mainAxisAlignment: mainAxisAlignment == null
          ? MainAxisAlignment.start
          : mainAxisAlignment!,
      children: [
        Text('$title1'),
        InkWell(
          onTap: onTap,
          child: Text(
            '$title2',
            style: TextStyle(color: appTheme.gold),
          ),
        ),
      ],
    );
  }
}
