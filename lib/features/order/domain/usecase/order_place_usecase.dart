import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/order/domain/repository/order_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/order_placed.dart';

class OrderPlaceUsecase implements UseCase<Either, OrderPlaced> {
  final OrderRepository orderRepository;

  OrderPlaceUsecase({required this.orderRepository});
  @override
  Future<Either> call({OrderPlaced? params}) async {
    return await orderRepository.placeOrder(params!);
  }
}
