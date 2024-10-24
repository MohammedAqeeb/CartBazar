part of 'favorite_products_cubit.dart';

@immutable
sealed class FavoriteProductsState {}

final class FavoriteProductsLoading extends FavoriteProductsState {}

final class FavoriteProductsSuccess extends FavoriteProductsState {
  final List<ProductEntity> prod;

  FavoriteProductsSuccess({required this.prod});
}

final class FavoriteProductsFailure extends FavoriteProductsState {
  final String errorMessage;

  FavoriteProductsFailure({required this.errorMessage});
}
