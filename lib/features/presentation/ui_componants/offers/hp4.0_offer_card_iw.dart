import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/domain/entities/offer_entity.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

/// [IW: Item Widget] [IM: Item Model]
// ignore: must_be_immutable
class JobOfferCardIW extends StatelessWidget {
  Offer offer;
   JobOfferCardIW({required this.offer,Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            imagePath: offer.offerImages!.isNotEmpty
                ? offer.offerImages![0]
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  offer.offerTitle ?? "",
                                  style: CustomTextStyles.homeCardTitleText,
                                ),
                              ),
                              Text(
                                offer.offerDescription !="" ?
                                "${offer.offerDescription!.substring(0, 10)}"
                                    :"-",
                                style: CustomTextStyles.homeCardDescriptionText,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),


                  SizedBox(height: 6.v),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
