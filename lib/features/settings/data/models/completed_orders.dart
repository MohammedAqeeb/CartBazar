import 'package:cart_bazar/core/common/helper/order/serializer.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_orders_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'completed_orders.g.dart';

@JsonSerializable(createToJson: false)
class CompletedOrders extends CompletedOrderEntity {
  CompletedOrders({
    required super.products,
    required super.createdDate,
    required super.shippingAddress,
    required super.itemCount,
    required super.totalPrice,
    required super.code,
    required super.orderStatus,
  });

  factory CompletedOrders.fromJson(Map<String, dynamic> json) =>
      _$CompletedOrdersFromJson(json);
}
