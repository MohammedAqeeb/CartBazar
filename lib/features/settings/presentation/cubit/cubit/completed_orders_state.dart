part of 'completed_orders_cubit.dart';

@immutable
sealed class CompletedOrdersState {}

final class CompletedOrdersLoading extends CompletedOrdersState {}

final class CompletedOrdersSuccess extends CompletedOrdersState {
  final List<CompletedOrderEntity> orders;

  CompletedOrdersSuccess({required this.orders});
}

final class CompletedOrdersFailure extends CompletedOrdersState {
  final String error;

  CompletedOrdersFailure({required this.error});
}
