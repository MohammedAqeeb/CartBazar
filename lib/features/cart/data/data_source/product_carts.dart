import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/cart/data/models/product_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductCartsDataSource {
  Future<Either<Failure, List<ProductCart>>> getProductCarts();
  Future<Either> removeCartProduct(String cartId);
}

class ProductCartsDataSourceImpl implements ProductCartsDataSource {
  var userId = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, List<ProductCart>>> getProductCarts() async {
    List<ProductCart> productCart = [];

    try {
      final query = await db
          .collection('Users')
          .doc(userId!.uid)
          .collection('Cart')
          .get();

      if (query.docs.isNotEmpty) {
        for (var items in query.docs) {
          productCart.add(ProductCart.fromJson(items.data()));
        }
      } else {
        return Left(Failure('No items in Cart'));
      }

      return Right(productCart);
    } catch (e) {
      return Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either> removeCartProduct(String cartId) async {
    try {
      await db
          .collection('Users')
          .doc(userId!.uid)
          .collection('Cart')
          .doc(cartId)
          .delete();

      return const Right('Produt removed successfully');
    } catch (e) {
      return const Left('Something went wrong');
    }
  }
}
