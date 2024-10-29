import 'package:cart_bazar/core/common/helper/order/serializer.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'completed_order_status.dart';

class CompletedOrderEntity {
  @JsonKey(fromJson: OrderSerializer.getCartProducts)
  final List<ProductCartEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  @JsonKey(fromJson: OrderSerializer.getOrderStatus)
  final List<CompletedOrderStatusEntity> orderStatus;

  CompletedOrderEntity({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
}
