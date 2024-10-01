import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../repository/get_products_repo.dart';

class NewProductsUseCase
    implements UseCase<Either<Failure, List<ProductEntity>>, NoParam> {
  final GetProductsRepository productsRepository;

  NewProductsUseCase({required this.productsRepository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call({NoParam? params}) async {
    return await productsRepository.fetchNewArrivals();
  }
}
