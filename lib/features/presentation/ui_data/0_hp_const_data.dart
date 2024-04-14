import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/presentation/ui_models/hp_category_im.dart';
 import 'package:wahg_v1/features/presentation/ui_models/jobs/jo_job_card_im.dart';
import 'package:wahg_v1/localization/app_localization.dart';

List<HPCategoryIM> getHPCategories() {
  return [
    HPCategoryIM(
        id: CategoryId.halls,
        categoryImage: ImageAsset.imgCategoryHalls,
        categoryText: "lbl_halls".tr),
    HPCategoryIM(
        id: CategoryId.dresses,
        categoryImage: ImageAsset.imgCategoryDresses,
        categoryText: "lbl_dresses".tr),
    HPCategoryIM(
        id: CategoryId.suits,
        categoryImage: ImageAsset.imgCategorySuits,
        categoryText: "lbl_suits".tr),
    HPCategoryIM(
        id: CategoryId.hair,
        categoryImage: ImageAsset.imgCategoryHair,
        categoryText: "lbl_hair".tr),
    HPCategoryIM(
        id: CategoryId.travel,
        categoryImage: ImageAsset.imgCategoryTravel,
        categoryText: "lbl_travel".tr),
    HPCategoryIM(
        id: CategoryId.makeup_artist,
        categoryImage: ImageAsset.imgCategoryMakeupArtist,
        categoryText: "lbl_makeup_artist".tr),
    HPCategoryIM(
        id: CategoryId.photographer,
        categoryImage: ImageAsset.imgCategoryPhotographer,
        categoryText: "lbl_photographer".tr),
    HPCategoryIM(
        id: CategoryId.cafe_and_restaurant,
        categoryImage: ImageAsset.imgCategoryCafeRestaurant,
        categoryText: "lbl_cafe_and_restaurant".tr),
  ];
}


List<JoJobCardIM> getJoJobsList() {
  return [
    JoJobCardIM(
        jobTitle: 'Makeup Artist',
        jobDes: 'Do your makeup so perfect',
        jobCategory: 'Mackup',
        jobSalary: '3000 L.E'),
    JoJobCardIM(
        jobTitle: 'Dresser Artist',
        jobDes: 'need it so ergent',
        jobCategory: 'Dresses',
        jobSalary: '5000 L.E'),
    JoJobCardIM(
        jobTitle: 'Wedding Planner',
        jobDes: 'we need the best',
        jobCategory: 'Halls',
        jobSalary: '7000 L.E'),
    JoJobCardIM(
        jobTitle: 'Makeup Artist',
        jobDes: 'Do your makeup so perfect',
        jobCategory: 'Mackup',
        jobSalary: '3000 L.E'),
    JoJobCardIM(
        jobTitle: 'Dresser Artist',
        jobDes: 'need it so ergent',
        jobCategory: 'Dresses',
        jobSalary: '5000 L.E'),
    JoJobCardIM(
        jobTitle: 'Wedding Planner',
        jobDes: 'we need the best',
        jobCategory: 'Halls',
        jobSalary: '7000 L.E'),
    JoJobCardIM(
        jobTitle: 'Makeup Artist',
        jobDes: 'Do your makeup so perfect',
        jobCategory: 'Mackup',
        jobSalary: '3000 L.E'),
    JoJobCardIM(
        jobTitle: 'Dresser Artist',
        jobDes: 'need it so ergent',
        jobCategory: 'Dresses',
        jobSalary: '5000 L.E'),
    JoJobCardIM(
        jobTitle: 'Wedding Planner',
        jobDes: 'we need the best',
        jobCategory: 'Halls',
        jobSalary: '7000 L.E'),
  ];
}
