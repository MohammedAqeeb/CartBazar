import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:cart_bazar/features/order/data/models/order_placed.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class OrderRepository {
  Future<Either> addToCart(Carts cart);
  Future<Either> placeOrder(OrderPlaced orders);
}
