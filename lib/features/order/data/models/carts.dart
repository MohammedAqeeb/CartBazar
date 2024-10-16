import 'package:cart_bazar/features/order/domain/entity/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carts.g.dart';

@JsonSerializable(createToJson: true)
class Carts extends CartEntity {
  Carts({
    required super.productId,
    required super.productTitle,
    required super.productQuantity,
    required super.productColor,
    required super.productSize,
    required super.productPrice,
    required super.totalPrice,
    required super.productImage,
    required super.createdDate,
  });

  factory Carts.fromJson(Map<String, dynamic> json) => _$CartsFromJson(json);

  Map<String, dynamic> toJson() => _$CartsToJson(this);
}
