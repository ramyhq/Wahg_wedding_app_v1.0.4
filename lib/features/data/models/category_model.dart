import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';


class CategoryModel extends Category {
  const CategoryModel({
    required super.categoryId,
    required super.categoryName,
  });


  factory CategoryModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return CategoryModel(
        categoryId: doc.id,
        categoryName:  doc.get('categoryName') as String,
      );
    } catch (e) {
      throw '❌ Error in CategoryModel.fromSnapshot : $e';
    }
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
     );
  }

  Map<String, dynamic> toDocument() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
    };
  }

}
