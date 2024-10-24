import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit_colors/selected_color_cubit.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/detail_screen/add_cart.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/detail_screen/selected_product_color.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/detail_screen/selected_product_size.dart';
import 'package:cart_bazar/features/home/presentation/widgets/favorite_button.dart';
import 'package:cart_bazar/features/home/presentation/widgets/product_images_list.dart';
import 'package:cart_bazar/init_dependency.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubit/favorite_product_cubit.dart';
import '../../../bloc/quantity_cubit/product_quantity_cubit.dart';
import '../../../bloc/size_cubit/selected_size.dart';
import 'product_quantity.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => SelectedColorCubit()),
        BlocProvider(create: (context) => SelectedSizeCubit()),
        BlocProvider(create: (context) => SubmitButtonCubit()),
        BlocProvider(
          create: (context) => FavoriteProductCubit(
            favUseCase: serviceLocator(),
            useCase: serviceLocator(),
          )..checkFavorite(productEntity.productId),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: AddCartButton(productEntity: productEntity),
        appBar: CustomAppBar(
          hideBack: false,
          action: FavoriteButton(
            productEntity: productEntity,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              children: [
                ProductTitleImageScreen(productEntity: productEntity),
                const SizedBox(height: 33),
                SelectedProductSize(productEntity: productEntity),
                const SizedBox(height: 12),
                SelectedProductColor(products: productEntity),
                const SizedBox(height: 12),
                const ProductQuantity(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
