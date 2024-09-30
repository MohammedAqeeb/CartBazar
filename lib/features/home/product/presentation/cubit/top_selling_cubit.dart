import 'package:cart_bazar/features/home/product/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/product/domain/usecase/top_selling_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_selling_state.dart';

class TopSellingCubit extends Cubit<TopSellingState> {
  final GetTopSellingProductsUseCase _productsUseCase;
  TopSellingCubit({
    required GetTopSellingProductsUseCase productsUseCase,
  })  : _productsUseCase = productsUseCase,
        super(TopSellingLoadig());

  Future<void> getTopSellingProducts() async {
    final products = await _productsUseCase.call();

    return products.fold(
      (error) => emit(TopSellingFailure(errorMessage: error.errorMessage)),
      (products) => emit(TopSellingSuccess(topSellingProducts: products)),
    );
  }
}
