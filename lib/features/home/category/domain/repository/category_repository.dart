import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/category/domain/entity/categories_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, List<CategoriesEntity>>> getCategoryList();
}
