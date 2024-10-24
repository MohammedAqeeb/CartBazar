import 'package:bloc/bloc.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/domain/usecase/add_favorite_product.dart';
import 'package:cart_bazar/features/home/domain/usecase/is_favourite.dart';

class FavoriteProductCubit extends Cubit<bool> {
  final IsFavoriteUsecase _isFavouriteUsecase;
  final AddFavoriteProductUseCase _addFavoriteProductUseCase;
  FavoriteProductCubit({
    required IsFavoriteUsecase useCase,
    required AddFavoriteProductUseCase favUseCase,
  })  : _isFavouriteUsecase = useCase,
        _addFavoriteProductUseCase = favUseCase,
        super(false);

  void checkFavorite(String productId) async {
    var result = await _isFavouriteUsecase.call(params: productId);
    emit(result);
  }

  void addFavoriteProduct(ProductEntity products) async {
    var addProduct = await _addFavoriteProductUseCase.call(params: products);

    return addProduct.fold((error) => {}, (prod) => emit(prod));
  }
}
