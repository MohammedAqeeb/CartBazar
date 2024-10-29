import 'package:cart_bazar/features/cart/data/models/product_cart.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_order_status.dart';

class OrderSerializer {
  static List<ProductCartEntity> getCartProducts(
    List<dynamic>? item,
  ) {
    List<ProductCartEntity> products = [];

    if (item != null) {
      for (var prod in item) {
        products.add(ProductCart.fromJson(prod));
      }
    }
    return products;
  }

  static List<CompletedOrderStatusEntity> getOrderStatus(
    List<dynamic>? item,
  ) {
    List<CompletedOrderStatusEntity> status = [];

    if (item != null) {
      for (var prod in item) {
        status.add(CompletedOrderStatusEntity.fromJson(prod));
      }
    }
    return status;
  }
}
