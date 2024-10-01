import 'package:cart_bazar/core/common/widgets/product/product_view.dart';

import 'package:cart_bazar/features/home/presentation/widgets/view_more.dart';
import 'package:cart_bazar/features/home/domain/usecase/top_selling_usecase.dart';
import 'package:cart_bazar/features/home/presentation/bloc/product_cubit/product_display_cubit.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/product_entity.dart';

class TopSellingProductScreen extends StatelessWidget {
  const TopSellingProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(
          useCase: serviceLocator<GetTopSellingProductsUseCase>())
        ..getProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsDisplayLoadig) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsDisplaySuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ViewMoreButton(firstText: 'Top Selling', onTap: () {}),
                ),
                const SizedBox(height: 20),
                _buildTopSelling(state.displayProducts),
              ],
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
    );
  }

  Widget _buildTopSelling(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductView(
              productEntity: products[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: products.length),
    );
  }
}
