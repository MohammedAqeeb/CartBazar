import 'package:cart_bazar/features/home/product/domain/entity/product_color_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_colors.g.dart';

@JsonSerializable(createToJson: false)
class ProductsColors extends ProductColorEntity {
  ProductsColors({
    required super.title,
    required super.rgb,
  });

  factory ProductsColors.fromJson(Map<String, dynamic> json) =>
      _$ProductsColorsFromJson(json);
}
