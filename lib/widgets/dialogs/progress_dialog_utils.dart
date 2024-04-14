import 'package:flutter/material.dart';
 import 'package:wahg_v1/routing/navigationx.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog(
      {BuildContext? context, isCancellable = false}) async {
    if (!isProgressVisible &&
        NavigationX.navigatorKey.currentState?.overlay?.context != null) {
      showDialog(
          barrierDismissible: isCancellable,
          context: NavigationX.navigatorKey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            );
          });
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible)
      Navigator.pop(
          NavigationX.navigatorKey.currentState!.overlay!.context);
    isProgressVisible = false;
  }
}
