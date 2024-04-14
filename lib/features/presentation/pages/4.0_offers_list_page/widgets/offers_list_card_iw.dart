import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/features/domain/entities/offer_entity.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';

import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/bloc/offers_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/offers_details_page.dart';

import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/app_tools.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OffersListCardIW extends StatelessWidget {
  OffersListCardIW(this.offer, {super.key});

  Offer offer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<OffersBloc>().add(OpenOfferDetailsEvent(offer));
        NavigationX.pushNamed(
          OffersDetailsPageScreen.id,
        );
      },
      child: Container(
        height: 290.v,
        width: 396.h,
        margin: EdgeInsets.symmetric(horizontal: 12.h),
        decoration: AppDecoration.cardDecoration,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            /// Divider
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 26,
                ),
                child: SizedBox(
                  width: 361.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: AppColors.grey_20,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Image
                  Expanded(
                    child: Container(
                      height: 159.v,
                      width: 396.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          CustomImageView(
                            imagePath: offer.offerImages!.isNotEmpty
                                ? offer.offerImages![0]
                                : ImageAsset.imageNotFound,
                            height: 159.v,
                            width: 393.h,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            radius: BorderRadius.vertical(
                              top: Radius.circular(12.h),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Title - Des - Price - Rating
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 17,
                        top: 6,
                        right: 17,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Description
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  hasData(offer.offerTitle)
                                      ? offer.offerTitle!
                                      : "No Title",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.hallsCardListTitleText,
                                ),
                                Text(
                                  hasData(offer.offerDescription)
                                      ? offer.offerDescription!
                                      : "No Description",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.hallsCardListDesText,
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
