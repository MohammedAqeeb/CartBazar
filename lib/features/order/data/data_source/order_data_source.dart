import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../models/order_placed.dart';

abstract interface class OrderDataSource {
  Future<Either> addToCart(Carts addToCart);
  Future<Either> productOrderPlaced(OrderPlaced orders);
}

class AddToCartDataSourceImpl implements OrderDataSource {
  var user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  @override
  Future<Either> addToCart(Carts addToCart) async {
    try {
      final query =
          db.collection('Users').doc(user!.uid).collection('Cart').doc();

      addToCart.cartId = query.id;

      await query.set(addToCart.toJson());

      return const Right('Add to cart was successfully');
    } catch (e) {
      return const Left('Please try again.');
    }
  }

  @override
  Future<Either> productOrderPlaced(OrderPlaced orders) async {
    try {
      final query =
          db.collection('Users').doc(user!.uid).collection('Order').doc();

      orders.orderId = query.id;

      await query.set(orders.toJson());

      //after order place deleting products in cart
      for (var carts in orders.products) {
        await db
            .collection('Users')
            .doc(user!.uid)
            .collection('Cart')
            .doc(carts.cartId)
            .delete();
      }

      return const Right('Order Placed Successfully');
    } catch (e) {
      return const Left('Unable to place order..Try Again Later');
    }
  }
}
