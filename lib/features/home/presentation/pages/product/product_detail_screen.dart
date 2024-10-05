import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/selected_product_color.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/selected_product_size.dart';
import 'package:cart_bazar/features/home/presentation/widgets/product_images_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_palletes.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hideBack: false,
        action: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: AppPalletes.secondBackground,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.favorite_border,
            size: 20,
            color: Colors.white,
          ),
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
              SelectedProductColor(products: productEntity)
            ],
          ),
        ),
      ),
    );
  }
}
