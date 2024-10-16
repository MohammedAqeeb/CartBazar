import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class OrderDataSource {
  Future<Either> addToCart(Carts addToCart);
}

class AddToCartDataSourceImpl implements OrderDataSource {
  @override
  Future<Either> addToCart(Carts addToCart) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCart.toJson());

      return const Right('Add to cart was successfully');
    } catch (e) {
      return const Left('Please try again.');
    }
  }
}
