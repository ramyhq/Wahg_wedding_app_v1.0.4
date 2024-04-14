import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/presentation/ui_componants/jobs/jo_job_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_data/0_hp_const_data.dart';
import 'package:wahg_v1/features/presentation/ui_models/jobs/jo_job_card_im.dart';
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

class JobsFragment extends StatelessWidget {
  static const String id = 'jobs_fragment';
  List<JoJobCardIM> jobsList = getJoJobsList();
  TextEditingController? searchController;

  JobsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildJobsCustomAppBar(),
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
                            "lbl_recent_jobs".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 15.v),
                        _buildRecentJobs(context),
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

  CustomAppBar _buildJobsCustomAppBar() {
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

  ///  Recent Jobs Section
  Widget _buildRecentJobs(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 18.v,
            );
          },
          itemCount: jobsList.length ?? 0,
          itemBuilder: (context, index) {
            JoJobCardIM item = jobsList[index];
            return JoJobCardIW(
              item,
            );
          },
        ),
      ),
    );
  }
}
