import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/domain/repository/get_products_repo.dart';
import 'package:fpdart/fpdart.dart';

class SearchProductUseCase
    implements UseCase<Either<Failure, List<ProductEntity>>, String> {
  final GetProductsRepository repository;

  SearchProductUseCase({required this.repository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call({String? params}) async {
    return await repository.searchProductsByTitle(params!);
  }
}
