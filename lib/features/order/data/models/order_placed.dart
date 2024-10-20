import 'package:cart_bazar/features/cart/data/models/product_cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_placed.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderPlaced {
  String orderId;
  final List<ProductCart> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderPlaced({
    required this.orderId,
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() => _$OrderPlacedToJson(this);

  
}
