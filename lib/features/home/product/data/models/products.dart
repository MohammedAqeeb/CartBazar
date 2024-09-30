import 'package:cart_bazar/core/serializer_helper/products_colors.dart';
import 'package:cart_bazar/features/home/product/domain/entity/product_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable(createToJson: false)
class Products extends ProductEntity {
  Products({
    required super.categoryId,
    required super.colors,
    required super.createdDate,
    required super.discountedPrice,
    required super.gender,
    required super.images,
    required super.prices,
    required super.productId,
    required super.title,
    required super.salesNumber,
    required super.sizes,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}
