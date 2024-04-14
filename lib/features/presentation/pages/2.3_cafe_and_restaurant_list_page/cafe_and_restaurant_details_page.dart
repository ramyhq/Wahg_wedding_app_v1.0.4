
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/commons/network/url_helper.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';

import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';

 
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/routing/routing.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/app_tools.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_button.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:wahg_v1/widgets/images/slider_image_header.dart';

class CafeAndRestaurantDetailsPageScreen extends StatefulWidget {
  static const String id = 'cafe_and_restaurant_details_page';

    CafeAndRestaurantDetailsPageScreen({this.cafeAndRestaurant,super.key});

  CafeAndRestaurant? cafeAndRestaurant  ;

  @override
  State<CafeAndRestaurantDetailsPageScreen> createState() => _CafeAndRestaurantDetailsPageScreenState();
}

class _CafeAndRestaurantDetailsPageScreenState extends State<CafeAndRestaurantDetailsPageScreen> {  Future<void>? _launched;

@override
  Widget build(BuildContext context) {


    return BlocBuilder<CafeAndRestaurantBloc, CafeAndRestaurantState>(
      builder: (context, state) {
         print("9999.1 ${state.selectedCafeAndRestaurant.cafeAndRestaurantTitle}");
         widget.cafeAndRestaurant=state.selectedCafeAndRestaurant;
        return  widget.cafeAndRestaurant != null ?  SafeArea(
          child: Scaffold(
           // backgroundColor: appTheme.goldWhite,
            body: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGoldWhite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Container(
                    //     height: 182.v,
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //       color: ColorConstant.blue50,
                    //       borderRadius: BorderRadius.circular(
                    //         6.h,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 20,
                          right: 16,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SliderImage(widget.cafeAndRestaurant!.cafeAndRestaurantImages!.isNotEmpty
                                ? widget.cafeAndRestaurant!.cafeAndRestaurantImages!
                                : [ImageAsset.imageNotFound]),
                            // CustomImageView(
                            //   imagePath:cafeAndRestaurant!.cafeAndRestaurantImages!.isNotEmpty
                            //       ? cafeAndRestaurant!.cafeAndRestaurantImages![0]
                            //       : ImageAsset.imageNotFound,
                            //   height: 233.v,
                            //   width: 290.h,
                            //   fit: BoxFit.cover,
                            //   alignment: Alignment.center,
                            // ),
                            CustomImageView(
                              imagePath: ImageAsset.imgSwipe,
                              height: 5.v,
                              width: 33.h,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                top: 24,
                              ),
                            ),
                            /// Title
                            Container(
                              width: 316.h,
                              margin: const EdgeInsets.only(
                                top: 16,
                                right: 79,
                              ),
                              child: Text(
                                hasData(widget.cafeAndRestaurant!.cafeAndRestaurantTitle)
                                  ? widget.cafeAndRestaurant!.cafeAndRestaurantTitle!
                                  : "No Title",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.titleLarge22,
                              ),
                            ),

                            /// Location
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                              child: Text(hasData(widget.cafeAndRestaurant!.cafeAndRestaurantLocation)
                                  ? "lbl_location".tr+ " : " + widget.cafeAndRestaurant!.cafeAndRestaurantLocation!
                                  : "lbl_location".tr +" : " + "Other",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.hallsDetailsLocationText,
                              ),
                            ),

                            /// Price and Social Media Icons
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                              child: Text("${hasData(widget.cafeAndRestaurant!.cafeAndRestaurantTitle)
                                  ? widget.cafeAndRestaurant!.cafeAndRestaurantPrice!
                                  : "0.0"} L.E",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.hallsDetailsPriceText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "lbl_description".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.hallsDetailsDesTitleText,
                                  ),
                                  /// Contact us
                                  Column(
                                    children: [
                                      Text(
                                        "lbl_contact_us".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles.hallsDetailsContactUsText,
                                      ),

                                      Row(children: [
                                        CustomImageView(
                                          imagePath: ImageAsset.imgIconFacebook,
                                          height: 35.v,
                                          width: 35.h,
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,

                                        ),
                                        CustomImageView(
                                          imagePath: ImageAsset.imgIconWhatsapp,
                                          height: 35.v,
                                          width: 35.h,
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,

                                        ),
                                      ],)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 373.h,
                              margin: const EdgeInsets.only(
                                top: 15,
                                right: 22,
                              ),
                              child: Text(hasData(widget.cafeAndRestaurant!.cafeAndRestaurantDescription)
                                  ? widget.cafeAndRestaurant!.cafeAndRestaurantDescription!
                                  : "No Description",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.hallsDetailsDesText,
                              ),
                            ),
                            CustomButton(
                              height: 50.v,
                              text: "lbl_call".tr,
                              margin: const EdgeInsets.only(
                                top: 27,
                              ),  onTap:() => setState(() {
                              _launched = URLHelper.makePhoneCall(widget.cafeAndRestaurant!.cafeAndRestaurantPhone1 ?? "000");
                            })
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ):ErrorPage();
      },
    );
  }
}
