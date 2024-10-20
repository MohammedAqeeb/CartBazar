import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductCartRepo {
  Future<Either<Failure, List<ProductCartEntity>>> getCartsItem();
  Future<Either> removeProduct(String cartId);
}
