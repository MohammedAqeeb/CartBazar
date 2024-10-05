import 'package:cart_bazar/core/assets/app_vector.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/common/widgets/product/product_view.dart';
import 'package:cart_bazar/features/home/domain/usecase/search_product_usecase.dart';
import 'package:cart_bazar/features/home/presentation/bloc/product_cubit/product_display_cubit.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entity/product_entity.dart';
import '../../widgets/search_field.dart';

class ProductSearchScreen extends StatelessWidget {
  const ProductSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: serviceLocator<SearchProductUseCase>()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: SearchField(),
        ),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsDisplayLoadig) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsDisplaySuccess) {
              return state.displayProducts.isEmpty
                  ? productNotFound()
                  : buildGridView(state.displayProducts);
            } else if (state is ProductDisplayFailure) {
              return productNotFound();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget buildGridView(List<ProductEntity> displayProducts) {
    return GridView.builder(
      itemCount: displayProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 24,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (BuildContext context, index) {
        final products = displayProducts[index];
        return ProductView(productEntity: products);
      },
    );
  }

  Widget productNotFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppVector.notFound,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        )
      ],
    );
  }
}
