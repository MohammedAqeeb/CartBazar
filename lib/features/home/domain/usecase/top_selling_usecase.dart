import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/domain/repository/get_products_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetTopSellingProductsUseCase
    implements UseCase<Either<Failure, List<ProductEntity>>, NoParam> {
  final GetProductsRepository productsRepository;

  GetTopSellingProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call({NoParam? params}) async {
    return await productsRepository.fetchTopSellingProduct();
  }
}
