part of 'product_cart_cubit.dart';

@immutable
sealed class ProductCartState {}

final class ProductCartLoading extends ProductCartState {}

final class ProductCarttSuccess extends ProductCartState {
  final List<ProductCartEntity> product;

  ProductCarttSuccess({required this.product});
}

final class ProductCartFailure extends ProductCartState {
  final String errorMessage;

  ProductCartFailure({required this.errorMessage});
}
