import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';

class CartCheckoutPriceHelper {
  static double calculateSubtotal(List<ProductCartEntity> carts) {
    double subTotalPrice = 0;

    for (var item in carts) {
      subTotalPrice = subTotalPrice + item.totalPrice;
    }
    return subTotalPrice;
  }
}
