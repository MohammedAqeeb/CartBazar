import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/home/domain/entity/categories_entity.dart';
import 'package:cart_bazar/features/home/domain/repository/category_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../data_source/categories_data_source.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final CategoriesDataSource categoriesDataSource;

  CategoryRepositoryImp({
    required this.categoriesDataSource,
  });
  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategoryList() async {
    return await categoriesDataSource.getCategory();
  }
}
