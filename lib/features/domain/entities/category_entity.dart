import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Category extends Equatable {
  final String categoryId;
  final String categoryName;

  const Category({
    required this.categoryId,
    required this.categoryName,
  });

  @override
  List<Object> get props => [categoryId, categoryName];


}