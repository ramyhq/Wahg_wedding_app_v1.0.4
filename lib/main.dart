import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/forgot_password_page.dart';
import 'package:wahg_v1/localization/app_localization/app_localization.dart';
import 'package:wahg_v1/localization/app_localization/ar_strings.dart';
import 'package:wahg_v1/localization/app_localization/languages_interface.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';
import 'package:wahg_v1/features/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:wahg_v1/features/presentation/blocs/setting_cubit/setting_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/credentail/cubit/credential_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0_splash_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/bloc/halls_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/bloc/dresses_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/bloc/photographer_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/bloc/hair_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/bloc/suit_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/bloc/travel_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/bloc/makeup_artist_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/3.0_jobs_list_page/bloc/jobs_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/bloc/offers_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/5.0_drawer_menu/bloc/drawer_bloc.dart';

import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/routing/routing.dart';
import 'package:wahg_v1/theme/bloc/theme_bloc.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';

import 'firebase_options.dart';
import 'package:wahg_v1/di/injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
var scaffoldKey = GlobalKey<ScaffoldState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  await di.init();
  await di.sl.isReady<SharedPreferences>();
  await di.sl.allReady();

  //TODO delete this >> await di.sl<AppSettingsCache>().setAppLanguage('ar');
  print(
      'Stored AppLanguage ${await di.sl<AppSettingsCache>().getAppLanguage()}');
  await initialize(aLocaleLanguageList: languageList());

  Future.wait([
    // TODO: Load here from sharedPrefrences the Dark Mode Value to apply it
    //  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    runApp(AppRoot());
  });
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // This widget is the root of your application.
  // will have the MultiProviders
  @override
  Widget build(BuildContext context) {
    log('🟪 PERFORMANCE (AppRoot > BlocBuilder)');

    return MultiBlocProvider(
      providers: [
        //Auth
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()),

        ///
        BlocProvider(lazy: false, create: (_) => CategoryBloc()),
        BlocProvider<SettingCubit>(
            lazy: false, create: (_) => SettingCubit()..setAppLanguage()),
        BlocProvider<ThemeBloc>(
          lazy: false,
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: sl<AppSettingsCache>().getThemeData(),
            ),
          ),
        ),
        BlocProvider<DrawerBloc>(
          create: (context) => DrawerBloc(),
        ),
// App Categories BlocProviders
        //BlocProvider(lazy: false, create: (_) => HallsBloc()),
        BlocProvider<HallsBloc>(
          create: (context) => di.sl<HallsBloc>()..add(GetHallsListEvent()),
        ),
        BlocProvider<DressesBloc>(
          create: (context) => di.sl<DressesBloc>()..add(GetDressesListEvent()),
        ),
        BlocProvider<PhotographerBloc>(
          create: (context) =>
              di.sl<PhotographerBloc>()..add(GetPhotographerListEvent()),
        ),
        BlocProvider<CafeAndRestaurantBloc>(
          create: (context) => di.sl<CafeAndRestaurantBloc>()
            ..add(GetCafeAndRestaurantListEvent()),
        ),
        BlocProvider<HairBloc>(
          create: (context) => di.sl<HairBloc>()..add(GetHairListEvent()),
        ),
        BlocProvider<SuitBloc>(
          create: (context) => di.sl<SuitBloc>()..add(GetSuitListEvent()),
        ),
        BlocProvider<TravelBloc>(
          create: (context) => di.sl<TravelBloc>()..add(GetTravelListEvent()),
        ),
        BlocProvider<MakeupArtistBloc>(
          create: (context) =>
              di.sl<MakeupArtistBloc>()..add(GetMakeupArtistListEvent()),
        ),
        BlocProvider<JobsBloc>(
          create: (context) => JobsBloc(),
        ),
        BlocProvider<OffersBloc>(
          create: (context) => OffersBloc(),
        ),
      ],
      child: AppThemeBuilder(),
    );
  }
}

class AppThemeBuilder extends StatelessWidget {
  const AppThemeBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return AppMaterialApp(appTheme:state.appTheme );
      },
    );
  }
}

class AppMaterialApp extends StatelessWidget {
  AppMaterialApp({super.key, this.appTheme});
  final ThemeData? appTheme;

  @override
  Widget build(BuildContext context) {
    print('x193 AppMaterialApp ${appTheme}');

    return Sizer(builder: (context, orientation, deviceType) {
      return BlocBuilder<SettingCubit, SettingState>(
        builder: (context, statex) {
          print(  '[📍Test] MaterialApp BlocBuilder STARTED ${statex.appLanguageLocale}');
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: txt.materialAppTitle,
            navigatorKey: NavigationX.navigatorKey,
            theme: statex.appTheme ?? theme,
            localizationsDelegates: const [
              //AppLocalizations(), // This is for cubit localizations
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
            ],

               locale: statex.appLanguageLocale,
            onGenerateRoute: Routers.generateRoute,
          );
        },
      );
    });
  }
}
