import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase})
      : super(ProductsDisplayLoadig());

  Future<void> getProducts({dynamic params}) async {
    emit(ProductsDisplayLoadig());
    final products = await useCase.call(params: params);

    products.fold(
      (error) => emit(ProductDisplayFailure(errorMessage: error.errorMessage)),
      (products) => emit(ProductsDisplaySuccess(displayProducts: products)),
    );
  }
}
