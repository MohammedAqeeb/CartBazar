// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedOrders _$CompletedOrdersFromJson(Map<String, dynamic> json) =>
    CompletedOrders(
      products: OrderSerializer.getCartProducts(json['products'] as List?),
      createdDate: json['createdDate'] as String,
      shippingAddress: json['shippingAddress'] as String,
      itemCount: (json['itemCount'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderId: json['orderId'] as String,
      orderStatus: OrderSerializer.getOrderStatus(json['orderStatus'] as List?),
    );
