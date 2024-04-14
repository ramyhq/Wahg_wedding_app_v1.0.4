
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/const/app_enums.dart';

/// This class is used in the [HPCategoryIW] screen.
/// [IW: Item Widget] [IM: Item Model]
class HPCategoryIM {
  String? categoryImage;

  String? categoryText;

  CategoryId? id;

  HPCategoryIM({
    this.categoryImage,
    this.categoryText,
    this.id,
  }) {
    categoryImage = categoryImage ?? ImageAsset.imagePlaceholder;
    categoryText = categoryText ?? "Category Name";
    id = id ?? CategoryId.halls;
  }


}
