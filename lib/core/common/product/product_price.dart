import '../../../features/home/domain/entity/product_entity.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.prices.toDouble();
  }
}
