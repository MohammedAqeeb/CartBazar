import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';

import 'order_status.dart';

class OrderEntity {
  final List<ProductCartEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
}
