import 'package:cart_bazar/core/assets/app_vector.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/common/widgets/product/product_view.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../cubit/favorite_products_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<GetFavoriteProductsCubit>()..getFavoriteProducts(),
      child: BlocBuilder<GetFavoriteProductsCubit, FavoriteProductsState>(
        builder: (context, state) {
          if (state is FavoriteProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteProductsFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is FavoriteProductsSuccess) {
            return buildBody(state);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget buildBody(FavoriteProductsSuccess state) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('My Favorites (${state.prod.length})'),
      ),
      body: state.prod.isEmpty
          ? productNotFound()
          : _buildFavoriteProducts(state.prod),
    );
  }

  Widget _buildFavoriteProducts(List<ProductEntity> products) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
            "You have not add any faorite products",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        )
      ],
    );
  }
}
