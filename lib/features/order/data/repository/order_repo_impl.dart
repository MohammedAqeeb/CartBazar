import 'package:cart_bazar/features/order/data/data_source/order_data_source.dart';
import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:cart_bazar/features/order/data/models/order_placed.dart';
import 'package:cart_bazar/features/order/domain/repository/order_repo.dart';
import 'package:fpdart/fpdart.dart';

class OrderRepoImplementation implements OrderRepository {
  final OrderDataSource orderDataSource;

  OrderRepoImplementation({required this.orderDataSource});
  @override
  Future<Either> addToCart(Carts cart) async {
    return await orderDataSource.addToCart(cart);
  }

  @override
  Future<Either> placeOrder(OrderPlaced orders) async {
    return await orderDataSource.productOrderPlaced(orders);
  }
}
