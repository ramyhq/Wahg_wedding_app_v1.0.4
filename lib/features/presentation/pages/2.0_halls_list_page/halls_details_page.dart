
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wahg_v1/commons/network/url_helper.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/bloc/halls_bloc.dart';
 
 
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

class HallsDetailsPageScreen extends StatefulWidget {
  static const String id = 'halls_details_page';

    HallsDetailsPageScreen({this.hall,super.key});

   Hall? hall  ;

  @override
  State<HallsDetailsPageScreen> createState() => _HallsDetailsPageScreenState();
}

class _HallsDetailsPageScreenState extends State<HallsDetailsPageScreen> {
  Future<void>? _launched;


  @override
  Widget build(BuildContext context) {


    return BlocBuilder<HallsBloc, HallsState>(
      builder: (context, state) {
        print("9999.1 ${state.selectedHall.hallTitle}");

        widget.hall = state.selectedHall;
        return  widget.hall != null ?  SafeArea(
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
                            SliderImage(widget.hall!.hallImages!.isNotEmpty
                                ? widget.hall!.hallImages!
                                : [ImageAsset.imageNotFound]),
                            // CustomImageView(
                            //   imagePath:hall!.hallImages!.isNotEmpty
                            //       ? hall!.hallImages![0]
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
                                hasData(widget.hall!.hallTitle)
                                  ? widget.hall!.hallTitle!
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
                              child: Text(hasData(widget.hall!.hallLocation)
                                  ? "lbl_location".tr+ " : " + widget.hall!.hallLocation!
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
                              child: Text("${hasData(widget.hall!.hallTitle)
                                  ? widget.hall!.hallPrice!
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
                              child: Text(hasData(widget.hall!.hallDescription)
                                  ? widget.hall!.hallDescription!
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
                              ),
                              onTap:() => setState(() {
                                _launched = URLHelper.makePhoneCall(widget.hall!.hallPhone1 ?? "000");
                              })
                                  ,
                            )
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
