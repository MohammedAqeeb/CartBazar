// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_placed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OrderPlacedToJson(OrderPlaced instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate,
      'shippingAddress': instance.shippingAddress,
      'itemCount': instance.itemCount,
      'totalPrice': instance.totalPrice,
      'orderStatus': instance.orderStatus.map((e) => e.toJson()).toList(),
    };
