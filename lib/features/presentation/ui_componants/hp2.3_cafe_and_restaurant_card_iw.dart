import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/cafe_and_restaurant_details_page.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

/// [IW: Item Widget] [IM: Item Model]
// ignore: must_be_immutable
class HPCafeAndRestaurantCardIW extends StatelessWidget {
  CafeAndRestaurant cafeAndRestaurant;
  HPCafeAndRestaurantCardIW({required this.cafeAndRestaurant,Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CafeAndRestaurantBloc>().add(OpenCafeAndRestaurantDetailsEvent(cafeAndRestaurant));
        NavigationX.pushNamed(CafeAndRestaurantDetailsPageScreen.id,);
      },
      child: SizedBox(
        height: 257.v,
        width: 203.h,
        child: Stack(
          //clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 257,
                width: 203.h,
                decoration: AppDecoration.cardDecoration,
              ),
            ),
            CustomImageView(
              alignment: Alignment.topCenter,
              imagePath: cafeAndRestaurant.cafeAndRestaurantImages!.isNotEmpty
                  ? cafeAndRestaurant.cafeAndRestaurantImages![0]
                  : ImageAsset.imageNotFound,
              height: 136.v,
              width: 203.h,
              fit: BoxFit.cover,

              radius: BorderRadius.vertical(
                top: Radius.circular(11.h),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    cafeAndRestaurant.cafeAndRestaurantTitle ?? "",
                                    style: CustomTextStyles.homeCardTitleText,
                                  ),
                                ),
                                Text(
                                  cafeAndRestaurant.cafeAndRestaurantDescription !="" ?
                                  "${cafeAndRestaurant.cafeAndRestaurantDescription!.substring(0, 10)}"
                                      :"-",
                                  style: CustomTextStyles.homeCardDescriptionText,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        cafeAndRestaurant.cafeAndRestaurantPrice ?? "0.0",
                        style: CustomTextStyles.homeCardPriceText,

                      ),
                    ),
                    SizedBox(height: 1.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Opacity(
                              opacity: 0.8,
                              child: CustomImageView(
                                imagePath: ImageAsset.imgAkarIconsLocation,
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                                padding: EdgeInsets.only(left: 2.v),
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 4.h,
                                ),
                                child: Text(
                                  cafeAndRestaurant.cafeAndRestaurantLocation ?? "",
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomImageView(
                              color: Colors.orangeAccent,
                              imagePath: ImageAsset.imgAntDesignStarFilled,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              padding: EdgeInsets.only(
                                top: 1.v,
                                bottom: 2.v,
                              ),
                            ),
                            Container(
                              width: 23.h,
                              margin: EdgeInsets.only(left: 3.h),
                              child: Text(
                                cafeAndRestaurant.cafeAndRestaurantRating ?? "5.0",

                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.smallBodyText1
                                    .copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 6.v),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
