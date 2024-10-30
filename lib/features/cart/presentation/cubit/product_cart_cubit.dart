import 'package:bloc/bloc.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:cart_bazar/features/cart/domain/usecase/get_cart_product.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/remove_cart_product.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final GetCartProductUseCase _productUseCase;
  final RemoveCartProductUseCase _removeCartProductUseCase;
  ProductCartCubit({
    required GetCartProductUseCase useCase,
    required RemoveCartProductUseCase removeUsecase,
  })  : _productUseCase = useCase,
        _removeCartProductUseCase = removeUsecase,
        super(ProductCartLoading());

  void getCartProduct() async {
    final getCart = await _productUseCase.call();

    if (isClosed) return;
    getCart.fold(
      (error) => emit(ProductCartFailure(errorMessage: error.errorMessage)),
      (products) => emit(ProductCarttSuccess(product: products)),
    );
  }

  Future<void> removeCartProduct(String id) async {
    emit(ProductCartLoading());
    final removedProd = await _removeCartProductUseCase.call(params: id);

    removedProd.fold(
      (error) => emit(ProductCartFailure(errorMessage: error)),
      (success) => getCartProduct(),
    );
  }
}
