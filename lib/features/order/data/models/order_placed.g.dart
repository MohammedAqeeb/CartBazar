// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_placed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OrderPlacedToJson(OrderPlaced instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'products': SHProducts.toProductCartJson(instance.products),
      'createdDate': instance.createdDate,
      'shippingAddress': instance.shippingAddress,
      'itemCount': instance.itemCount,
      'totalPrice': instance.totalPrice,
      'orderStatus': SHProducts.toStatus(instance.orderStatus),
    };
