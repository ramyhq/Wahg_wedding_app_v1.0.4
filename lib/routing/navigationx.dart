import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorCtx {

  static goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static pushNamedWithClearAllRoutes(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  static pushNamedWithData(BuildContext context, String routeName, Object argumentClass) {
    Navigator.pushNamed(
        context,
        routeName,
        arguments: argumentClass
    );
  }

  // URL valid for this plugin only are
  // https://www.flutter.dev
  // http://www.flutter.dev
  // https://flutter.dev
  // http://flutter.dev
  //
  // For this it's not working
  // www.flutter.dev
  // flutter.dev
  static launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

class NavigationX {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



  static void goBack() {
    return navigatorKey.currentState?.pop();
  }


  static Future<dynamic> pushNamed(String routeName,
      ) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName);
  }

  static Future<dynamic> pushNamedWithData(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    return navigatorKey.currentState?.pushReplacementNamed(
        routeName,
        arguments: arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }


  // URL valid for this plugin only are
  // https://www.flutter.dev
  // http://www.flutter.dev
  // https://flutter.dev
  // http://flutter.dev
  //
  // For this it's not working
  // www.flutter.dev
  // flutter.dev
  static launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}