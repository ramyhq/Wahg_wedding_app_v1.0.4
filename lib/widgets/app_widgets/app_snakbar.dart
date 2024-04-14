import 'package:flutter/material.dart';

class SnackBarX {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      blackSnackBar(BuildContext context ,{required String content, }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white, letterSpacing: 0.5),
      ),
    ));
  }
}
