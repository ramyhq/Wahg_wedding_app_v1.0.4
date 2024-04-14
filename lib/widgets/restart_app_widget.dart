import 'package:flutter/material.dart';
import 'package:koroapps1/main.dart';
import 'package:koroapps1/routing/navigationx.dart';
import 'package:nb_utils/nb_utils.dart';

/// use this widget to restart app after change local (Language)
/// 1.wrap material app with it
/// 2. call this RestartWidget.restartApp(context);

/// or you can use this code
/// await context.read<SettingCubit>().setAppLanguage(value: 'ar');
// Remove any route in the stack
// Navigator.of(context).popUntil((route) => false);
//
// // Add the first route. Note MyApp() would be your first widget to the app.
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => const MyApp()),
// );

// RestateWidget not working if you have routingNavigationKey

class RestartWidget extends StatefulWidget {
  final Widget child;
  const RestartWidget({super.key, required this.child});


  static restartApp(BuildContext context) {
    final _RestartWidgetState? state =
    context.findAncestorStateOfType<_RestartWidgetState>();
    if(state != null){state.restartApp();
    print('55 restartApp');}
  }



  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key =  UniqueKey();

  void restartApp() {

    setState(() {
   key =  UniqueKey();
      print('66 restartApp');
      //navigatorKey2=GlobalKey<NavigatorState>();
      // NavigationX.navigatorKey=GlobalKey<NavigatorState>(();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('77 restartApp');

    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
