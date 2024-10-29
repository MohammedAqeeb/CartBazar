import 'package:cart_bazar/core/serializer_helper/products.dart';

import 'package:json_annotation/json_annotation.dart';

import 'product_color_entity.dart';

class ProductEntity {
  final String categoryId;

  @JsonKey(fromJson: SHProducts.getProductColors, toJson: SHProducts.toStatus)
  final List<ProductColorEntity> colors;

  @JsonKey(
      fromJson: SHProducts.timestampToDateTime,
      toJson: SHProducts.currentServerTimestamp)
  final DateTime? createdDate;

  final num discountedPrice;
  final String gender;
  final List<String> images;
  final num prices;
  final List<String> sizes;
  final String productId, title;
  final int salesNumber;

  ProductEntity({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.prices,
    required this.sizes,
    required this.productId,
    required this.title,
    required this.salesNumber,
  });
}
