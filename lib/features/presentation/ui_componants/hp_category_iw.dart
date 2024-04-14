import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/halls_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/dresses_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/photographer_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/cafe_and_restaurant_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/hair_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/suit_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/travel_list_page.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/makeup_artist_list_page.dart';
import 'package:wahg_v1/features/presentation/ui_models/hp_category_im.dart';
import 'package:wahg_v1/routing/navigationx.dart';

import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

/// [IW: Item Widget] [IM: Item Model]
// ignore: must_be_immutable
class HPCategoryIW extends StatelessWidget {
  HPCategoryIW(
    this.categoryIM, {
    Key? key,
  }) : super(
          key: key,
        );

  HPCategoryIM categoryIM;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('8888888 categoryIM.id: ${categoryIM.id}');

        _goToListPage(categoryIM.id);
      },
      child: Container(
        width: 76.h,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(boxShadow: AppDecoration.getHPShadows),
                child: CustomImageView(
                  imagePath: categoryIM.categoryImage,
                  height: 90.v,
                  width: 76.h,
                  radius: BorderRadius.circular(
                    12.h,
                  ),
                ),
              ),
              SizedBox(height: 6.v),
              FittedBox(
                child: Text(
                  categoryIM.categoryText!,
                  style: CustomTextStyles.categoryIconText,
                ),
              ),
              SizedBox(height: 10.v),
            ],
          ),
        ),
      ),
    );
  }

  _goToListPage(CategoryId? id) {
    switch (id) {
      case CategoryId.halls:
        return NavigationX.pushNamed(HallsListPage.id);
      case CategoryId.dresses:
        return NavigationX.pushNamed(DressesListPage.id);
      case CategoryId.photographer:
        return NavigationX.pushNamed(PhotographerListPage.id);
      case CategoryId.cafe_and_restaurant:
        return NavigationX.pushNamed(CafeAndRestaurantListPage.id);
      case CategoryId.hair:
        return NavigationX.pushNamed(HairListPage.id);
      case CategoryId.suits:
        return NavigationX.pushNamed(SuitsListPage.id);
      case CategoryId.travel:
        return NavigationX.pushNamed(TravelListPage.id);
      case CategoryId.makeup_artist:
        return NavigationX.pushNamed(MakeupArtistListPage.id);

      default:
        return NavigationX.pushNamed("/");
    }
  }
}
