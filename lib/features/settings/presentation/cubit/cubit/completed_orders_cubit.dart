import 'package:bloc/bloc.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_orders_entity.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecase/completed_orders_usecase.dart';

part 'completed_orders_state.dart';

class CompletedOrdersCubit extends Cubit<CompletedOrdersState> {
  final CompletedOrdersUsecase _completedOrdersUsecase;
  CompletedOrdersCubit({
    required CompletedOrdersUsecase orders,
  })  : _completedOrdersUsecase = orders,
        super(CompletedOrdersLoading());

  Future<void> getOrders() async {
    final order = await _completedOrdersUsecase.call();

    order.fold(
      (message) => emit(CompletedOrdersFailure(error: message.errorMessage)),
      (order) => emit(CompletedOrdersSuccess(orders: order)),
    );
  }
}
