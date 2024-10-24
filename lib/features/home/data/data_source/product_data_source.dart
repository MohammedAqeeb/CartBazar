import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/data/models/products.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductDataSource {
  Future<Either<Failure, List<Products>>> getTopSellingProducts();
  Future<Either<Failure, List<Products>>> getNewArrivalProducts();
  Future<Either<Failure, List<Products>>> getProductsByCategory(
      String categoryId);

  Future<Either<Failure, List<Products>>> searchProduct(String product);
  Future<Either> addOrRemoveFavorite(Products products);
  Future<bool> isFavorite(String productId);
  Future<Either<Failure, List<Products>>> getFavoritesProducts();
}

class ProductDataSourceImp implements ProductDataSource {
  final db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  @override
  Future<Either<Failure, List<Products>>> getTopSellingProducts() async {
    final List<Products> productList = [];

    try {
      final query = await db
          .collection('products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();

      if (query.docs.isNotEmpty) {
        for (var topProd in query.docs) {
          productList.add(Products.fromJson(topProd.data()));
        }
      } else {
        return Left(Failure('Top Selling Products not available'));
      }
      return Right(productList);
    } catch (e) {
      return Left(Failure('Something went wrong..Try again later'));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getNewArrivalProducts() async {
    final List<Products> newProducts = [];

    try {
      final query = await db
          .collection('products')
          .where('createdDate', isGreaterThan: DateTime(2024, 09, 22))
          .get();

      if (query.docs.isNotEmpty) {
        for (var newProd in query.docs) {
          newProducts.add(Products.fromJson(newProd.data()));
        }
      } else {
        return Left(Failure(' New Products Not Available'));
      }
      return Right(newProducts);
    } catch (e) {
      return Left(Failure('Something went wrong..Try again later'));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getProductsByCategory(
    String categoryId,
  ) async {
    final List<Products> newProducts = [];

    try {
      final query = await db
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      if (query.docs.isNotEmpty) {
        for (var newProd in query.docs) {
          newProducts.add(Products.fromJson(newProd.data()));
        }
      } else {
        return Left(Failure('Product for this Category Not Available'));
      }
      return Right(newProducts);
    } catch (e) {
      return Left(Failure('Something went wrong..Try again later'));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> searchProduct(String product) async {
    final List<Products> searchProduct = [];

    try {
      final searchQuery = await db
          .collection('products')
          .where('title', isGreaterThanOrEqualTo: product)
          .get();

      if (searchQuery.docs.isNotEmpty) {
        for (var result in searchQuery.docs) {
          searchProduct.add(Products.fromJson(result.data()));
        }
      } else {
        return Left(Failure('Product Not Found'));
      }
      return Right(searchProduct);
    } catch (e) {
      return Left(Failure('Something went wrong..Try again later'));
    }
  }

  @override
  Future<Either> addOrRemoveFavorite(Products products) async {
    try {
      var query = await db
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where(
            'productId',
            isEqualTo: products.productId,
          )
          .get();
      if (query.docs.isNotEmpty) {
        await query.docs.first.reference.delete();
        return const Right(false);
      } else {
        db
            .collection('Users')
            .doc(user!.uid)
            .collection('Favorites')
            .add(products.toJson());
        return const Right(true);
      }
    } catch (e) {
      return const Left('Something went wrong');
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getFavoritesProducts() async {
    List<Products> products = [];
    try {
      var query = await db
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .get();

      if (query.docs.isNotEmpty) {
        products.clear();
        for (var prod in query.docs) {
          products.add(Products.fromJson(prod.data()));
        }
      } else {
        return Left(Failure('Add Products to Favorites'));
      }
      return Right(products);
    } catch (e) {
      return Left(
        Failure('Unable to fetch Products'),
      );
    }
  }
}














//   @override
//   void getProducts() {
//     final query = db.collection('products').doc();

//     query.set({
//       'categoryId': 'jKkONan1Fd6kPPLkeTS2',
//       'colors': [
//         {"title": "yellow", "rgb": "#FFFF00"}
//       ],
//       'createdDate': DateTime.timestamp(),
//       'discountedPrice': 100,
//       'gender': 'male',
//       'images': [''],
//       'prices': 1600,
//       'sizes': ['30', '34', '36', '38', '40', '42'],
//       'productId': query.id,
//       'title': 'Nike Windrunner',
//       'salesNumber': 26,
//     });
//   }
// }
// 'sizes': ['7', '8', '9', '10', '11', '12'],
// 'sizes': ['42', '44', '46', '48', '50', '52'],
