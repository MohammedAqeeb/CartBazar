// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carts _$CartsFromJson(Map<String, dynamic> json) => Carts(
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      productQuantity: (json['productQuantity'] as num).toInt(),
      productColor: json['productColor'] as String,
      productSize: json['productSize'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$CartsToJson(Carts instance) => <String, dynamic>{
      'productId': instance.productId,
      'productTitle': instance.productTitle,
      'productQuantity': instance.productQuantity,
      'productColor': instance.productColor,
      'productSize': instance.productSize,
      'productPrice': instance.productPrice,
      'totalPrice': instance.totalPrice,
      'productImage': instance.productImage,
      'createdDate': instance.createdDate,
    };
