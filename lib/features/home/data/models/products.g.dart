// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      categoryId: json['categoryId'] as String,
      colors: SHProducts.getProductColors(json['colors'] as List?),
      createdDate:
          SHProducts.timestampToDateTime(json['createdDate'] as Timestamp?),
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

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'colors': SHProducts.toStatus(instance.colors),
      'createdDate': SHProducts.currentServerTimestamp(instance.createdDate),
      'discountedPrice': instance.discountedPrice,
      'gender': instance.gender,
      'images': instance.images,
      'prices': instance.prices,
      'sizes': instance.sizes,
      'productId': instance.productId,
      'title': instance.title,
      'salesNumber': instance.salesNumber,
    };
