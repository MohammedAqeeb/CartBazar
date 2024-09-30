part of 'top_selling_cubit.dart';

@immutable
sealed class TopSellingState {}

final class TopSellingLoadig extends TopSellingState {}

final class TopSellingSuccess extends TopSellingState {
  final List<ProductEntity> topSellingProducts;

  TopSellingSuccess({required this.topSellingProducts});
}

final class TopSellingFailure extends TopSellingState {
  final String errorMessage;

  TopSellingFailure({required this.errorMessage});
}
