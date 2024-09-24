part of 'categories_list_cubit.dart';

@immutable
sealed class CategoriesListState {}

final class CategoriesListLoading extends CategoriesListState {}

final class CategoriesListSuccess extends CategoriesListState {
  final List<CategoriesEntity> categoriesEntity;

  CategoriesListSuccess({required this.categoriesEntity});
}

final class CategoriesListFailure extends CategoriesListState {
  final String errorMessage;

  CategoriesListFailure({required this.errorMessage});
}
