import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/home/domain/entity/categories_entity.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/product/product_view.dart';
import '../../domain/usecase/product_by_category_usecase.dart';
import '../bloc/product_cubit/product_display_cubit.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final CategoriesEntity categoriesEntity;
  const ProductsByCategoryScreen({super.key, required this.categoriesEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hideBack: false,
      ),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(
            useCase: serviceLocator<ProductByCategoryUsecase>())
          ..getProducts(params: categoriesEntity.categoryId),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsDisplayLoadig) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsDisplaySuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryInfo(state.displayProducts),
                    const SizedBox(height: 20),
                    _buildNewInProduct(state.displayProducts),
                  ],
                ),
              );
            } else if (state is ProductDisplayFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      '${categoriesEntity.categoryName} (${products.length})',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _buildNewInProduct(List<ProductEntity> products) {
    return Expanded(
        child: GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 24,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return ProductView(
          productEntity: products[index],
        );
      },
    ));
  }
}
