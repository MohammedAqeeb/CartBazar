import 'package:cart_bazar/features/home/domain/usecase/new_products_usecase.dart';
import 'package:cart_bazar/features/home/presentation/bloc/product_cubit/product_display_cubit.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/product/product_view.dart';
import '../../widgets/view_more.dart';
import '../../../domain/entity/product_entity.dart';

class NewArrivalProductScreen extends StatelessWidget {
  const NewArrivalProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(
          useCase: serviceLocator<NewProductsUseCase>())
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
                  child: ViewMoreButton(firstText: 'New In', onTap: () {}),
                ),
                const SizedBox(height: 20),
                _buildNewInProduct(state.displayProducts),
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

  Widget _buildNewInProduct(List<ProductEntity> products) {
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
