part of 'product_display_cubit.dart';

@immutable
sealed class ProductsDisplayState {}

final class ProductsInitialState extends ProductsDisplayState {}

final class ProductsDisplayLoadig extends ProductsDisplayState {}

final class ProductsDisplaySuccess extends ProductsDisplayState {
  final List<ProductEntity> displayProducts;

  ProductsDisplaySuccess({required this.displayProducts});
}

final class ProductDisplayFailure extends ProductsDisplayState {
  final String errorMessage;

  ProductDisplayFailure({required this.errorMessage});
}
