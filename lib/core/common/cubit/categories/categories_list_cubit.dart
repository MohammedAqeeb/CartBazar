import 'package:cart_bazar/features/home/category/domain/entity/categories_entity.dart';
import 'package:cart_bazar/features/home/category/domain/usecase/category_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_list_state.dart';

class CategoriesListCubit extends Cubit<CategoriesListState> {
  final CategoryUseCase _categoryUseCase;
  CategoriesListCubit({
    required CategoryUseCase useCase,
  })  : _categoryUseCase = useCase,
        super(CategoriesListLoading());

  Future<void> getList() async {
    final categoryList = await _categoryUseCase.call();

    return categoryList.fold(
      (error) => emit(
        CategoriesListFailure(errorMessage: error.toString()),
      ),
      (list) => emit(CategoriesListSuccess(categoriesEntity: list)),
    );
  }
}
