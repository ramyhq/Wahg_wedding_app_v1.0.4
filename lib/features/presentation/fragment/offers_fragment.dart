import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';
import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/bloc/offers_bloc.dart';
import 'package:wahg_v1/features/presentation/ui_componants/offers/hp4.0_offer_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_data/0_hp_const_data.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_title.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_trailing_image.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/custom_app_bar.dart';
import 'package:wahg_v1/widgets/custom_search_view.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:wahg_v1/localization/app_localization.dart';

class OffersFragment extends StatelessWidget {
  static const String id = 'offers_fragment';
  TextEditingController? searchController;

  OffersFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildOffersCustomAppBar(),
        extendBodyBehindAppBar: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGoldWhite,
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.center,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 24.h,vertical: 20.h,),
              //     child: CustomSearchView(
              //       controller: searchController,
              //       hintText: "lbl_search".tr,
              //       alignment: Alignment.center,
              //     ) ,
              //   ),
              // ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 22.h, top: 20.h),
                          child: Text(
                            "lbl_recent_offers".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildRecentOffers(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isLoading(RequestState? req) {

    switch(req){
      case RequestState.initial:
        return true;
      case RequestState.loading:
        return true;
      default:
        return false;

    }

  }
  CustomAppBar _buildOffersCustomAppBar() {
    return CustomAppBar(
      height: 70.v,
      leadingWidth: 56.h,
      leading: AppbarLeadingIconbutton(
        //imagePath: ImageAsset.imgMegaphone,
        margin: EdgeInsets.only(
          left: 20.h,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_welcome".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageAsset.imgBiBell,
          margin: EdgeInsets.only(
            left: 16.h,
            top: 6.v,
            right: 10.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageAsset.imgImage74,
          margin: EdgeInsets.only(
            left: 19.h,
            top: 6.v,
            right: 12.h,
          ),
        ),
      ],
    );
  }

  ///  Recent Offers Section
  Widget _buildRecentOffers(BuildContext context) {
    return BlocBuilder<OffersBloc, OffersState>(
      builder: (context, state) {
        List<Offer> offersList = state.offersList;

        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : Align(
            alignment: Alignment.center,
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: ListView.separated(
            clipBehavior: Clip.none,
                 physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context,
                    index,) {
                  return SizedBox(
                    height: 10.v,
                  );
                },
                itemCount: offersList.length  ,
                itemBuilder: (context, index) {
                   return JobOfferCardIW(
                    offer:offersList[index],
                  );
                },
              ),),
            );
      },
    );
  }
}
