import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/presentation/ui_models/hp_category_im.dart';
import 'package:wahg_v1/features/presentation/ui_models/jobs/jo_job_card_im.dart';
import 'package:wahg_v1/features/presentation/ui_models/jobs/jo_tag_iw.dart';

import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/date_time_utils.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_icon_button.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

/// [IW: Item Widget] [IM: Item Model]
// ignore: must_be_immutable
class JoJobCardIW extends StatelessWidget {
  JoJobCardIW(
    this.joJobCardIM, {
    Key? key,
  }) : super(
          key: key,
        );

  JoJobCardIM joJobCardIM;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.h),
        decoration: AppDecoration.cardDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                joJobCardIM.jobTitle!,
                                style: CustomTextStyles.jobsCardListTitleText,
                              ),
                              SizedBox(height: 2.v),
                              Text(
                                joJobCardIM.jobDes!,
                                style: CustomTextStyles.jobsCardListDesText,
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          runSpacing: 8.v,
                          spacing: 8.h,
                          children: List<Widget>.generate(
                            1,
                            (index) {
                              return JoJobTagWidget('Category');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      joJobCardIM.jobSalary!,
                      style: CustomTextStyles.jobsCardListPriceText,
                    ),
                    Text(
                      "Post in: ${joJobCardIM.jobPostDate!.format(dateTimeFormatPattern)}",
                      style: CustomTextStyles.jobsCardListPostTimeText,
                    ),
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
