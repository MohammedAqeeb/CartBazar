import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/data/models/products.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductDataSource {
  Future<Either<Failure, List<Products>>> getTopSellingProducts();
  Future<Either<Failure, List<Products>>> getNewArrivalProducts();
  Future<Either<Failure, List<Products>>> getProductsByCategory(
      String categoryId);
}

class ProductDataSourceImp implements ProductDataSource {
  final db = FirebaseFirestore.instance;

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
