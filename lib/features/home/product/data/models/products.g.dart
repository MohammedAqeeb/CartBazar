// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      categoryId: json['categoryId'] as String,
      colors: SHProductColors.getProductColors(json['colors'] as List?),
      createdDate: SHProductColors.timestampToDateTime(
          json['createdDate'] as Timestamp?),
      discountedPrice: json['discountedPrice'] as num,
      gender: json['gender'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      prices: json['prices'] as num,
      productId: json['productId'] as String,
      title: json['title'] as String,
      salesNumber: (json['salesNumber'] as num).toInt(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
    );
