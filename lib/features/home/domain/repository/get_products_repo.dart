import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GetProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchTopSellingProduct();
  Future<Either<Failure, List<ProductEntity>>> fetchNewArrivals();
  Future<Either<Failure, List<ProductEntity>>> fetchProductsByCategory(String categoryId);
}
