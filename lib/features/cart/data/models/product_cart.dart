import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_cart.g.dart';

@JsonSerializable(createToJson: true)
class ProductCart extends ProductCartEntity {
  ProductCart({
    required super.productId,
    required super.productTitle,
    required super.productQuantity,
    required super.productColor,
    required super.productSize,
    required super.productPrice,
    required super.totalPrice,
    required super.productImage,
    required super.createdDate,
    required super.cartId,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) =>
      _$ProductCartFromJson(json);

   Map<String, dynamic> toJson() => _$ProductCartToJson(this);
}
