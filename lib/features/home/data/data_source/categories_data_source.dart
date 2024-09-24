import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/data/model/categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fpdart/fpdart.dart';

abstract interface class CategoriesDataSource {
  Future<Either<Failure, List<Categories>>> getCategory();
}

class CategoriesDataSourceImp implements CategoriesDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<Categories>>> getCategory() async {
    try {
      List<Categories> categoriesList = [];

      final getCategories = await db.collection('categories').get();

      if (getCategories.docs.isNotEmpty) {
        categoriesList.clear();
        for (var cate in getCategories.docs) {
          categoriesList.add(Categories.fromJson(cate.data()));
        }
      }

      return Right(categoriesList);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
