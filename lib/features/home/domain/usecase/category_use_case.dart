import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/home/domain/entity/categories_entity.dart';
import 'package:cart_bazar/features/home/domain/repository/category_repository.dart';
import 'package:fpdart/fpdart.dart';

class CategoryUseCase
    implements UseCase<Either<Failure, List<CategoriesEntity>>, NoParam> {
  final CategoryRepository categoryRepository;

  CategoryUseCase({required this.categoryRepository});
  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(
      {NoParam? params}) async {
    return await categoryRepository.getCategoryList();
  }
}
