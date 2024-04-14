import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_colors.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';


import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/widgets/cafe_and_restaurant_list_card_iw.dart';

import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/routing/navigationx.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_title.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_trailing_image.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/custom_app_bar.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

import 'package:flutter/material.dart';

class CafeAndRestaurantListPage extends StatefulWidget {
  static const String id = 'cafe_and_restaurant_list_page';


  CafeAndRestaurantListPage({super.key});

  @override
  State<CafeAndRestaurantListPage> createState() => _CafeAndRestaurantListPageState();
}

class _CafeAndRestaurantListPageState extends State<CafeAndRestaurantListPage> {

  @override
  void initState() {
    super.initState();
    init();
    loadData();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
  }

  Future<void> loadData() async {
    print('⚠️ 006 CafeAndRestaurantListPage loadData in initState');
    context.read<CafeAndRestaurantBloc>().add(GetCafeAndRestaurantListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              height: 48.v,
              leadingWidth: 40,
              backgroundColor: appTheme.goldWhite,
              leading: CustomImageView(
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  imagePath: ImageAsset.imgArrowleft,
                  padding:
                  const EdgeInsets.only(left: 16, top: 13, bottom: 11),
                  onTap: () {
                    NavigationX.goBack();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_cafe_and_restaurant_list_page".tr),
              actions: [
                AppbarTrailingImage(
                  imagePath: ImageAsset.imgBiBell,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 6.v,
                    right: 20.h,
                  ),
                ),

              ],),
            body: BlocBuilder<CafeAndRestaurantBloc, CafeAndRestaurantState>(
              builder: (context, state) {
                List<CafeAndRestaurant> cafeAndRestaurantList = state.cafeAndRestaurantList;

                return Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.fillGoldWhite,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 25, right: 16),
                              child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 24),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 16.v);
                                  },
                                  itemCount: cafeAndRestaurantList.length ,
                                  itemBuilder: (context, index) {
                                    CafeAndRestaurant cafeAndRestaurant = cafeAndRestaurantList[index];
                                    return CafeAndRestaurantListCardIW(cafeAndRestaurant);
                                  })),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
