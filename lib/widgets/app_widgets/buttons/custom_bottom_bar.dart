import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';
import 'package:wahg_v1/localization/app_localization.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageAsset.imgNavHome,
      activeIcon: ImageAsset.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageAsset.imgNavVendors,
      activeIcon: ImageAsset.imgNavVendors,
      title: "lbl_profile".tr ,
      type: BottomBarEnum.Profile,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.v,
      decoration: BoxDecoration(
        color: appTheme.goldWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.h),
        ),

      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    enableColorFilter: true,
                    color: appTheme.grayBlack,
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(top: 7.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: appTheme.blueGray900.withOpacity(0.86),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: appTheme.red,
                  enableColorFilter:true ,

                ),
                Padding(
                  padding: EdgeInsets.only(top: 7.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: appTheme.red,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
