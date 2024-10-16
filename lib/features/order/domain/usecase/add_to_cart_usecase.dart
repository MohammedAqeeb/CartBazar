import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:cart_bazar/features/order/domain/repository/order_repo.dart';
import 'package:fpdart/fpdart.dart';

class AddToCartUsecase implements UseCase<Either, Carts> {
  final OrderRepository orderRepository;

  AddToCartUsecase({required this.orderRepository});
  @override
  Future<Either> call({Carts? params}) async {
    return await orderRepository.addToCart(params!);
  }
}
