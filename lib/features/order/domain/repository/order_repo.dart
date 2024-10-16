import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class OrderRepository {
  Future<Either> addToCart(Carts cart);
}
