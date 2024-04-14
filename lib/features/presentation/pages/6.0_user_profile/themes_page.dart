import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/presentation/blocs/setting_cubit/setting_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0_splash_page.dart';
import 'package:wahg_v1/features/presentation/pages/1_main_container.dart';
import 'package:wahg_v1/main.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/bloc/theme_bloc.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_image.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_title.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/custom_app_bar.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:restart_app/restart_app.dart';

class ThemePage extends StatefulWidget {
  static const String id = "theme_page";

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  String? selectedThemeMode ;

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Theme Changed, please restart the app'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Ok', style: TextStyle(color: Colors.black)),
              onPressed: () {
               // Navigator.of(context).pop();
               // Navigator.of(context).pop();


               // NavigationX.navigatorKey.currentState!.popUntil((route) => false);
               // NavigationX.navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(
               //     builder: (context) => HPDash()),(route) => false);
               // NavigationX.navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(
               //     builder: (context) => HPDash()), (route) => route.isFirst);
               //


               // Navigator.of(context).popUntil((route) => false);
               // Navigator.push(
               //   context,
               //   MaterialPageRoute(
               //       settings: const RouteSettings(name: '/root'),
               //
               //       builder: (context) => AppRoot()),
               // );


                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SplashPage()),
                // );

                //Restart.restartApp(webOrigin: '/');
                Navigator.pushNamedAndRemoveUntil(context,HPDash.id,(_) => false);

                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AppRoot()), (route) => false);

              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
      print('0kl99 ${state.themeType}');
      print('0kl99 ${  context.read<SettingCubit>().state.isDarkMode}');
    //  BlocProvider.of<SettingCubit>(context).changeTheme('light');

      selectedThemeMode = state.themeType;
      return SafeArea(
          child: Scaffold(
              bottomSheet: BottomSheet(
                elevation: 10,
                enableDrag: false,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 45),
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.black,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      onPressed: () async{
                       await _showAlertDialog();
                        //   Navigator.of(context).popUntil((route) => false);
                        //
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => HPDash()),
                        //   );


                      },
                    ),
                  );
                },
                onClosing: () {},
              ),
              appBar: CustomAppBar(
                  height: (51.v),
                  leadingWidth: 40,
                  leading: AppbarImage(
                      height: (24.adaptSize),
                      width: (24.adaptSize),
                      imagePath: ImageAsset.imgArrowleft,
                      padding: const EdgeInsets.all(5),
                      onTap: () {
                        NavigationX.goBack();
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "lbl_themes".tr)),
              body: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                      left: 16, top: 23, right: 16, bottom: 23),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Dark Mode option
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  imagePath: ImageAsset.imgMoon,
                                  height: (24.adaptSize),
                                  width: (24.adaptSize)),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 1, bottom: 2),
                                  child: Text("lbl_dark_mode".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.homeCardTitleText)),
                              const Spacer(),
                              Radio(
                                value: 'dark',
                                groupValue: selectedThemeMode,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    BlocProvider.of<SettingCubit>(context).changeTheme('dark');

                                  });
                                },
                              ),
                            ]),
                        //Light Mode option

                        Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageAsset.imgBrightness,
                                      height: (24.adaptSize),
                                      width: (24.adaptSize)),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 3, bottom: 1),
                                      child: Text("lbl_light_mode".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .homeCardTitleText)),
                                  const Spacer(),
                                  Radio(
                                    value: 'light',
                                    groupValue: selectedThemeMode,
                                    onChanged: (dynamic value) {
                                      setState(() {

                                        BlocProvider.of<SettingCubit>(context).changeTheme('light');

                                      });
                                    },
                                  ),


                                ]))
                      ]))));
    });
  }
}
