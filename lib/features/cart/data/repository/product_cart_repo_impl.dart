import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/cart/data/data_source/product_carts.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:cart_bazar/features/cart/domain/repository/product_cart_repo.dart';
import 'package:fpdart/fpdart.dart';

class ProductCartRepoImpl implements ProductCartRepo {
  final ProductCartsDataSource productCartsDataSource;

  ProductCartRepoImpl({required this.productCartsDataSource});

  @override
  Future<Either<Failure, List<ProductCartEntity>>> getCartsItem() async {
    return await productCartsDataSource.getProductCarts();
  }

  @override
  Future<Either> removeProduct(String cartId) async {
    return await productCartsDataSource.removeCartProduct(cartId);
  }
}
