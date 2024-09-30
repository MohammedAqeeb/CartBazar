import 'package:cart_bazar/features/home/category/domain/entity/categories_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable(createToJson: false)
class Categories extends CategoriesEntity {
  Categories({
    required super.categoryId,
    required super.categoryName,
    required super.image,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}
