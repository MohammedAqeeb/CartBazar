import 'package:cart_bazar/core/serializer_helper/products.dart';
import 'package:cart_bazar/features/cart/data/models/product_cart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_status.dart';

part 'order_placed.g.dart';

@JsonSerializable(createToJson: true,createFactory: false)
class OrderPlaced {
  String orderId;
  @JsonKey(toJson: SHProducts.toProductCartJson)
  final List<ProductCart> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  @JsonKey(toJson: SHProducts.toStatus)
  final List<OrderStatus> orderStatus;

  OrderPlaced({
    required this.orderId,
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.orderStatus,
  });

  Map<String, dynamic> toJson() => _$OrderPlacedToJson(this);
}
//     'orderId': instance.orderId,
//       'products': instance.products.map((e) => e.toJson()).toList(),
//       'createdDate': instance.createdDate,
//       'shippingAddress': instance.shippingAddress,
//       'itemCount': instance.itemCount,
//       'totalPrice': instance.totalPrice,
//       'orderStatus': instance.orderStatus.map((e) => e.toJson()).toList(),