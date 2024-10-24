import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/domain/repository/get_products_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/products.dart';

class AddFavoriteProductUseCase implements UseCase<Either, ProductEntity> {
  final GetProductsRepository productsRepository;

  AddFavoriteProductUseCase({required this.productsRepository});
  @override
  Future<Either> call({ProductEntity? params}) async {
    return await productsRepository.addOrRemoveFav(params! as Products);
  }
}
