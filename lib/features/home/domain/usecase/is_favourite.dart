import 'package:cart_bazar/core/usecase/use_case.dart';

import '../repository/get_products_repo.dart';

class IsFavoriteUsecase implements UseCase<bool, String> {
  final GetProductsRepository productsRepository;

  IsFavoriteUsecase({required this.productsRepository});

  @override
  Future<bool> call({String? params}) async {
    return await productsRepository.isFavorite(params!);
  }
}
