import 'package:bloc/bloc.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/domain/usecase/get_favorites_product.dart';
import 'package:flutter/material.dart';

part 'favorite_products_state.dart';

class GetFavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  final GetFavoritesProductUsecase _productUsecase;

  GetFavoriteProductsCubit({
    required GetFavoritesProductUsecase useCase,
  })  : _productUsecase = useCase,
        super(FavoriteProductsLoading());

  void getFavoriteProducts() async {
    emit(FavoriteProductsLoading());
    var getProduct = await _productUsecase.call();

    getProduct.fold((error) {
      emit(FavoriteProductsFailure(errorMessage: error.errorMessage));
    }, (products) {
      emit(FavoriteProductsSuccess(prod: products));
    });
  }
}
