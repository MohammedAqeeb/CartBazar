// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCart _$ProductCartFromJson(Map<String, dynamic> json) => ProductCart(
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      productQuantity: (json['productQuantity'] as num).toInt(),
      productColor: json['productColor'] as String,
      productSize: json['productSize'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      createdDate: json['createdDate'] as String,
      cartId: json['cartId'] as String,
    );

Map<String, dynamic> _$ProductCartToJson(ProductCart instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
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
