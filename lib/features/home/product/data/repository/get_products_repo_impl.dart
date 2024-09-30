import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/product/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/product/domain/repository/get_products_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../data_source/product_data_source.dart';

class GetProductsRepoImpl implements GetProductsRepository {
  final ProductDataSource productDataSource;

  GetProductsRepoImpl({required this.productDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchTopSellingProduct() async {
    return await productDataSource.getTopSellingProducts();
  }
}
