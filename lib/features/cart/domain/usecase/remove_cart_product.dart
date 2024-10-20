import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:fpdart/fpdart.dart';

import '../repository/product_cart_repo.dart';

class RemoveCartProductUseCase implements UseCase<Either, String> {
  final ProductCartRepo productCartRepo;

  RemoveCartProductUseCase({required this.productCartRepo});
  @override
  Future<Either> call({String? params}) async {
    return await productCartRepo.removeProduct(params!);
  }
}
