import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/cart/domain/repository/product_cart_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../entity/product_cart_entity.dart';

class GetCartProductUseCase
    implements UseCase<Either<Failure, List<ProductCartEntity>>, NoParam> {
  final ProductCartRepo productCartRepo;

  GetCartProductUseCase({required this.productCartRepo});
  @override
  Future<Either<Failure, List<ProductCartEntity>>> call(
      {NoParam? params}) async {
    return await productCartRepo.getCartsItem();
  }
}
