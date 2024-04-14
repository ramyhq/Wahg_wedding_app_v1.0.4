import 'package:flutter/material.dart';

import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/forgot_password_page.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/login_page.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_pages/register_page.dart';

import 'package:wahg_v1/features/presentation/pages/0.0_auth/constant.dart';
import 'package:wahg_v1/features/presentation/pages/0_splash_page.dart';
import 'package:wahg_v1/features/presentation/pages/1_main_container.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/halls_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/halls_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/dresses_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/dresses_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/photographer_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/photographer_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/cafe_and_restaurant_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/cafe_and_restaurant_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/hair_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/hair_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/suit_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/suit_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/travel_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/travel_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/makeup_artist_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/makeup_artist_list_page.dart';

import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/offers_details_page.dart';
import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/offers_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/language_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/my_profile_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/themes_page.dart';
import 'package:wahg_v1/features/presentation/pages/6.0_user_profile/user_setting_page.dart';
import 'package:wahg_v1/main.dart';

class Routers {
  static const String initialRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case initialRoute:
        {
          return MaterialPageRoute(builder: (_) => const SplashPage());
        }


      /// Auth

      case ForgotPasswordPage.id:
        {
          return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
        }
      case LoginPage.id:
        {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
      case RegisterPage.id:
        {
          return MaterialPageRoute(builder: (_) => RegisterPage());
        }
/////
      case HPDash.id:
        {
          return MaterialPageRoute(builder: (_) => HPDash());
        }

      /// Halls
      case HallsListPage.id:
        {
          return MaterialPageRoute(builder: (_) => HallsListPage());
        }
      case HallsDetailsPageScreen.id:
        {
          return MaterialPageRoute(builder: (_) => HallsDetailsPageScreen());
        }

      /// Dresses
      case DressesListPage.id:
        {
          return MaterialPageRoute(builder: (_) => DressesListPage());
        }
      case DressesDetailsPageScreen.id:
        {
          return MaterialPageRoute(builder: (_) => DressesDetailsPageScreen());
        }

      /// Photographer
      case PhotographerListPage.id:
        {
          return MaterialPageRoute(builder: (_) => PhotographerListPage());
        }
      case PhotographerDetailsPageScreen.id:
        {
          return MaterialPageRoute(
              builder: (_) => PhotographerDetailsPageScreen());
        }

      /// CafeAndRestaurant
      case CafeAndRestaurantListPage.id:
        {
          return MaterialPageRoute(builder: (_) => CafeAndRestaurantListPage());
        }
      case CafeAndRestaurantDetailsPageScreen.id:
        {
          return MaterialPageRoute(
              builder: (_) => CafeAndRestaurantDetailsPageScreen());
        }

      /// Hair
      case HairListPage.id:
        {
          return MaterialPageRoute(builder: (_) => HairListPage());
        }
      case HairDetailsPageScreen.id:
        {
          return MaterialPageRoute(builder: (_) => HairDetailsPageScreen());
        }

      /// Suit
      case SuitsListPage.id:
        {
          return MaterialPageRoute(builder: (_) => SuitsListPage());
        }
      case SuitDetailsPageScreen.id:
        {
          return MaterialPageRoute(builder: (_) => SuitDetailsPageScreen());
        }

      /// Travel
      case TravelListPage.id:
        {
          return MaterialPageRoute(builder: (_) => TravelListPage());
        }
      case TravelDetailsPageScreen.id:
        {
          return MaterialPageRoute(builder: (_) => TravelDetailsPageScreen());
        }

      /// MakeupArtistDetailsPageScreen
      case MakeupArtistListPage.id:
        {
          return MaterialPageRoute(builder: (_) => MakeupArtistListPage());
        }
      case MakeupArtistDetailsPageScreen.id:
        {
          return MaterialPageRoute(
              builder: (_) => MakeupArtistDetailsPageScreen());
        }

      /// Offers
      case OffersListPage.id:
        {
          return MaterialPageRoute(builder: (_) => OffersListPage());
        }
      case OffersDetailsPageScreen.id:
        {
          return MaterialPageRoute(builder: (_) => OffersDetailsPageScreen());
        }

      /// User Profile
      case ProfilePage.id:
        {
          return MaterialPageRoute(builder: (_) => ProfilePage());
        }
      case MyProfilePage.id:
        {
          return MaterialPageRoute(builder: (_) => MyProfilePage());
        }
      case ThemePage.id:
        {
          return MaterialPageRoute(builder: (_) => ThemePage());
        }

      case LanguagePage.id:
        {
          return MaterialPageRoute(builder: (_) => LanguagePage());
        }
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
// TODO Make this Beautful
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('Error Page '),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getting Bots...'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
