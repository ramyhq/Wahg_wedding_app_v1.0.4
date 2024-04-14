import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/features/domain/entities/jobs/job_entity.dart';
import 'package:wahg_v1/features/presentation/pages/3.0_jobs_list_page/bloc/jobs_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/3.0_jobs_list_page/jobs_details_page.dart';



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
class JobsListCardIW extends StatelessWidget {
  JobsListCardIW(this.job, {super.key});

  Job job;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<JobsBloc>().add(OpenJobDetailsEvent(job));
        NavigationX.pushNamed(JobsDetailsPageScreen.id,);
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
                            imagePath: job.jobImages!.isNotEmpty
                                ? job.jobImages![0]
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
                            fit:FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  hasData(job.jobTitle)
                                      ? job.jobTitle!
                                      : "No Title",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.jobsCardListTitleText,
                                ),
                                Text(
                                  hasData(job.jobDescription)
                                      ? job.jobDescription!
                                      : "No Description",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.jobsCardListDesText,
                                ),
                                Row(
                                  children: [
                                    Text(hasData(job.jobSalary)?
                                      job.jobSalary! : "0.0",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          CustomTextStyles.jobsCardListPriceText,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
      // Rating
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                      left: 6,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 6,
                                      top: 2,
                                      right: 10,
                                      bottom: 0,
                                    ),
                                    decoration:
                                        AppDecoration.fillGoldWhite.copyWith(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          color: Colors.orangeAccent,
                                          imagePath:
                                              ImageAsset.imgAntDesignStarFilled,
                                          height: 19.adaptSize,
                                          width: 19.adaptSize,
                                          padding: EdgeInsets.only(
                                            right: 2.v,
                                            bottom: 2.v,
                                          ),
                                        ),

                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Location
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 17,
                      top: 8,
                      bottom: 4,
                    ),
                    child: Row(
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
                            child: Text(hasData(job.jobLocation)?
                            job.jobLocation! : "Other",
                              style: CustomTextStyles.jobsCardListLocationText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
