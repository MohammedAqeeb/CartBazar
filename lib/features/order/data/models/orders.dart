import 'package:cart_bazar/features/order/domain/entity/orders.dart';

class Orders extends OrderEntity {
  Orders({
    required super.products,
    required super.createdDate,
    required super.shippingAddress,
    required super.itemCount,
    required super.totalPrice,
    required super.code,
    required super.orderStatus,
  });
}
