import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wahg_v1/commons/network/url_helper.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/data/datasource/remote/firebase_datasource_imp.dart';
import 'package:getwidget/getwidget.dart';

import 'package:wahg_v1/features/data/datasource/remote/firebase_storage.dart';
import 'package:wahg_v1/features/data/datasource/remote/jobs/job_firebase_datasource_imp.dart';
import 'package:wahg_v1/features/data/datasource/remote/offers/offer_firebase_datasource_imp.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';
import 'package:wahg_v1/features/domain/entities/suit_entity.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';
import 'package:wahg_v1/features/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:wahg_v1/features/presentation/blocs/setting_cubit/setting_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/bloc/halls_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/bloc/dresses_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/bloc/photographer_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/bloc/hair_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/bloc/suit_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/bloc/travel_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/bloc/makeup_artist_bloc.dart';

import 'package:wahg_v1/features/presentation/pages/5.0_drawer_menu/drawer_menu_Page.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.2_photographer_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.3_cafe_and_restaurant_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.4_hair_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.5_suit_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.6_travel_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.7_makeup_artist_card_iw.dart';

import 'package:wahg_v1/features/presentation/ui_componants/hp_category_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.1_dress_card_iw.dart';
import 'package:wahg_v1/features/presentation/ui_componants/hp2.0_hall_card_iw.dart';

import 'package:wahg_v1/features/presentation/ui_data/1_halls_data.dart';

import 'package:wahg_v1/features/presentation/ui_data/0_hp_const_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/2_dresses_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/3_photographer_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/4_cafe_and_restaurant_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/5_hair_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/6_suit_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/7_travel_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/8_makeup_artist_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/jobs/1_jobs_data.dart';
import 'package:wahg_v1/features/presentation/ui_data/offers/1_offers_data.dart';
import 'package:wahg_v1/features/presentation/ui_models/hp_category_im.dart';
 import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/main.dart';

import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_title.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/appbar_trailing_image.dart';
import 'package:wahg_v1/widgets/app_widgets/app_bar/custom_app_bar.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_elevated_button.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

class HomeFragment extends StatefulWidget {
  static const String id = 'hp_fragment';

  @override
  HomeFragmentState createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
  List<HPCategoryIM> categoriesL = getHPCategories();

  //List<HPHallCardIW> servicesL = getHPServices();

  @override
  void initState() {
    super.initState();
    init();
    loadData();
  }

  Future<void> init() async {
   // setStatusBarColor(Colors.transparent);
  }

  Future<void> loadData() async {
    print('⚠️ 000 loadData in initState');
    themeIsDark = context.read<SettingCubit>().state.isDarkMode;

    // context.read<HallsBloc>().add(GetHallsListEvent());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          //backgroundColor: context.cardColor,
          child: DrawerMenuPage(),
        ),
        body: Container(
          width: double.maxFinite,
         // decoration: AppDecoration.fillGoldWhite,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWelcomeSection(context),
                        SizedBox(height: 21.v),
                        _buildJobsApplySection(context),
                        SizedBox(height: 27.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_our_categories".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildCategorySection(context),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_halls".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildHallsSection(context),
                        SizedBox(height: 48.v),
                        CustomImageView(
                          imagePath: ImageAsset.imgOffers1,
                          height: 100.v,
                          width: 360.h,
                        ),
                        SizedBox(height: 48.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_dresses".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildDressSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_photographer".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildPhotographerSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_cafe_and_restaurant".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildCafeAndRestaurantSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_hair".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildHairSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_suits".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildSuitSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_travel".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildTravelSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "lbl_makeup_artist".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildMakeupArtistSection(context),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "msg_recommended_for".tr,
                            style: CustomTextStyles.homeSectionTitleText,
                          ),
                        ),
                        SizedBox(height: 6.v),
                         CustomImageView(
                          imagePath: ImageAsset.imgOffers1,
                          height: 100.v,
                          width: 360.h,
                        ),
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

  CustomAppBar buildAppBar(BuildContext contextx) {
    return CustomAppBar(
      height: 45.v,
      leadingWidth: 56.h,
      leading: AppbarLeadingIconbutton(
        //imagePath: ImageAsset.imgMegaphone,
        margin: EdgeInsets.only(
          left: 20.h,
        ),
        onTap: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_welcome".tr,
      ),
      actions: const [
        // AppbarTrailingImage(
        //   imagePath: ImageAsset.imgBiBell,
        //   margin: EdgeInsets.only(
        //     left: 16.h,
        //     top: 6.v,
        //     right: 10.h,
        //   ),
        // ),
        // AppbarTrailingImage(
        //   imagePath: ImageAsset.imgImage74,
        //   margin: EdgeInsets.only(
        //     left: 19.h,
        //     top: 6.v,
        //     right: 12.h,
        //   ),
        // ),
      ],
    );
  }

  /// Welcome Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 410.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageAsset.imgMaskGroup,
              height: 410.v,
              width: 360.h,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 24.v,
                  right: 16.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                    textDirection: TextDirection.rtl
                        ,
                    child: buildAppBar(context)),
                    SizedBox(
                      height: 50.v,
                      //width: double.infinity,
                    ),
                    Text(
                      "lbl_hello".tr,
                      style: theme.textTheme.displayMedium,
                    ),
                    SizedBox(height: 5.v),
                    Opacity(
                      opacity: 0.8,
                      child: Container(
                        width: 157.h,
                        margin: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "msg_add_a_detailed_profile".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.smallBodyText1.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13.v),
                    // CustomElevatedButton(
                    //   width: 142.h,
                    //   text: "lbl_set_up_profile".tr,
                    //   buttonTextStyle: CustomTextStyles.homeWelcomeBtnText,
                    //   margin: EdgeInsets.only(left: 3.h),
                    //   onPressed: () {
                    //     // print('Get Hall is : Gooooo');
                    //     // print(
                    //     //     'Get Hall is : Gooooo :${context.read<HallsBloc>().state.requestState}');
                    //
                    //     //context.read<HallsListBloc>().add(GetHallsListEvent());
                    //
                    //     // print(
                    //     //     'Get Hall is : Gooooo :${context.read<HallsBloc>().state.hallsList}');
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //         firestore: sl.call(),
                    //     //         auth: sl.call(),
                    //     //         googleSignIn: sl.call())
                    //     //     .updateAllHallsList(data: hallsData['data']);
                    //     //
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //     firestore: sl.call(),
                    //     //     auth: sl.call(),
                    //     //     googleSignIn: sl.call())
                    //     //     .updateAllDressesList(data: dressesData['data']);
                    //     //
                    //     //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //     firestore: sl.call(),
                    //     //     auth: sl.call(),
                    //     //     googleSignIn: sl.call())
                    //     //     .updateAllPhotographerList(data: photographerData['data']);
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //         firestore: sl.call(),
                    //     //         auth: sl.call(),
                    //     //         googleSignIn: sl.call())
                    //     //     .updateAllCafeAndRestaurantList(
                    //     //         data: cafeAndRestaurantData['data']);
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //         firestore: sl.call(),
                    //     //         auth: sl.call(),
                    //     //         googleSignIn: sl.call())
                    //     //     .updateAllHairList(
                    //     //         data: hairData['data']);
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //         firestore: sl.call(),
                    //     //         auth: sl.call(),
                    //     //         googleSignIn: sl.call())
                    //     //     .updateAllSuitsList(
                    //     //         data: suitData['data']);
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //         firestore: sl.call(),
                    //     //         auth: sl.call(),
                    //     //         googleSignIn: sl.call())
                    //     //     .updateAllTravelList(
                    //     //         data: travelData['data']);
                    //
                    //     // FirebaseRemoteDataSourceImp(
                    //     //         firestore: sl.call(),
                    //     //         auth: sl.call(),
                    //     //         googleSignIn: sl.call())
                    //     //     .updateAllMakeupArtistList(
                    //     //         data: makeupArtistData['data']);
                    //
                    //     JobsFirebaseRemoteDataSourceImp(
                    //             firestore: sl.call(),
                    //             auth: sl.call(),
                    //             googleSignIn: sl.call())
                    //         .updateAllJobsList(
                    //             data: jobsData['data']);
                    //     OffersFirebaseRemoteDataSourceImp(
                    //         firestore: sl.call(),
                    //         auth: sl.call(),
                    //         googleSignIn: sl.call())
                    //         .updateAllOffersList(
                    //         data: offersData['data']);
                    //
                    //
                    //     //   FirebaseRemoteStorageImp().getURLs();
                    //   },
                    // ),



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // final Uri jobApplyURI = Uri(scheme: 'https', host: 'forms.gle/K7ingYKF8XbGPhEG9', path: 'headers/');

     final Uri toLaunch = Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLScX3nXfVh71vLxyShiNEzSUH2dtofH_AOHhJrPHL-yCPj1oQw/viewform?usp=sf_link');

  /// Jobs Apply Section Widget
  Widget _buildJobsApplySection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        URLHelper.launchInWebView(toLaunch);
       },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 107.v,
            width: 335.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 107.v,
                    width: 334.h,
                    decoration: BoxDecoration(
                      color: appTheme.lime700,
                      borderRadius: BorderRadius.circular(
                        16.h,
                      ),
                      boxShadow: AppDecoration.getHPShadows,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 335.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 6.v,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                      image: DecorationImage(
                        image: fs.Svg(
                          ImageAsset.imgGroup23,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.v),
                            Text(
                              "lbl_become_a_seller".tr,
                              style: themeIsDark ? theme.textTheme.labelLarge.copyWith(
                                color:Colors.black
                              ): theme.textTheme.labelLarge,
                            ),
                            SizedBox(height: 3.v),
                            SizedBox(
                              width: 197.h,
                              child: Text(
                                "msg_you_can_join_us".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.smallBodyText1,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 53.h,
                          margin: EdgeInsets.only(
                            left: 46.h,
                            top: 65.v,
                          ),
                          child: Text(
                            "lbl_apply".tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: appTheme.goldWhite,
                            ),
                          ),
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
    );
  }

  /// Categories Section Widget
  Widget _buildCategorySection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 275.v,
        child: Wrap(
          children: List.generate(8, (index) {
            HPCategoryIM item = categoriesL[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: HPCategoryIW(item),
            );
          }),
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

  /// Halls Section Widget
  Widget _buildHallsSection(BuildContext context) {
    return BlocBuilder<HallsBloc, HallsState>(
      builder: (context, state) {
         List<Hall> hallsList = state.hallsList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
                height: 257.v,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: 10.h,
                    );
                  },
                  itemCount: hallsList.length,
                  itemBuilder: (context, index) {
                    return HPHallCardIW(
                      hall: hallsList[index],
                    );
                  },
                ),
              );
      },
    );
  }

  /// Dresses Section Widget
  Widget _buildDressSection(BuildContext context) {
    return BlocBuilder<DressesBloc, DressesState>(
      builder: (context, state) {
        List<Dress> dressesList = state.dressesList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            :SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: dressesList.length,
            itemBuilder: (context, index) {
              return HPDressCardIW(
                dress: dressesList[index],
              );
            },
          ),
        );
      },
    );
  }

  /// Photographer Section Widget
  Widget _buildPhotographerSection(BuildContext context) {
    return BlocBuilder<PhotographerBloc, PhotographerState>(
      builder: (context, state) {
        List<Photographer> photographerList = state.photographerList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: photographerList.length,
            itemBuilder: (context, index) {
              return HPPhotographerCardIW(
                photographer: photographerList[index],
              );
            },
          ),
        );
      },
    );
  }

  /// CafeAndRestaurant Section Widget
  Widget _buildCafeAndRestaurantSection(BuildContext context) {
    return BlocBuilder<CafeAndRestaurantBloc, CafeAndRestaurantState>(
      builder: (context, state) {
        List<CafeAndRestaurant> cafeAndRestaurantList =
            state.cafeAndRestaurantList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: cafeAndRestaurantList.length,
            itemBuilder: (context, index) {
              return HPCafeAndRestaurantCardIW(
                cafeAndRestaurant: cafeAndRestaurantList[index],
              );
            },
          ),
        );
      },
    );
  }

  /// Hair Section Widget
  Widget _buildHairSection(BuildContext context) {
    return BlocBuilder<HairBloc, HairState>(
      builder: (context, state) {
        List<Hair> hairList = state.hairList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: hairList.length,
            itemBuilder: (context, index) {
              return HPHairCardIW(
                hair: hairList[index],
              );
            },
          ),
        );
      },
    );
  }

  /// Suit Section Widget
  Widget _buildSuitSection(BuildContext context) {
    return BlocBuilder<SuitBloc, SuitState>(
      builder: (context, state) {
        List<Suit> suitList = state.suitsList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: suitList.length,
            itemBuilder: (context, index) {
              return HPSuitCardIW(
                suit: suitList[index],
              );
            },
          ),
        );
      },
    );
  }

  /// Travel Section Widget
  Widget _buildTravelSection(BuildContext context) {
    return BlocBuilder<TravelBloc, TravelState>(
      builder: (context, state) {
        List<Travel> travelList = state.travelList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: travelList.length,
            itemBuilder: (context, index) {
              return HPTravelCardIW(
                travel: travelList[index],
              );
            },
          ),
        );
      },
    );
  }

  /// MakeupArtist Section Widget
  Widget _buildMakeupArtistSection(BuildContext context) {
    return BlocBuilder<MakeupArtistBloc, MakeupArtistState>(
      builder: (context, state) {
        List<MakeupArtist> makeupArtistList = state.makeupArtistList;
        return isLoading(state.requestState)
            ? const GFLoader(type: GFLoaderType.ios)
            : SizedBox(
          height: 257.v,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: makeupArtistList.length,
            itemBuilder: (context, index) {
              return HPMakeupArtistCardIW(
                makeupArtist: makeupArtistList[index],
              );
            },
          ),
        );
      },
    );
  }


}
