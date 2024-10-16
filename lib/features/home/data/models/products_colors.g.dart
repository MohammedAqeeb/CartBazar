// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_colors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsColors _$ProductsColorsFromJson(Map<String, dynamic> json) =>
    ProductsColors(
      title: json['title'] as String,
      rgb: (json['rgb'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );
