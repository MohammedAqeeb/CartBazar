import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductView({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context, ProductDetailScreen(productEntity: productEntity));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppPalletes.secondBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildProductImage(),
            productInfo(),
          ],
        ),
      ),
    );
  }

  Widget productInfo() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productEntity.title,
              style: const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              children: [
                Text(
                  productEntity.discountedPrice == 0
                      ? "${productEntity.prices}\$"
                      : "${productEntity.discountedPrice}\$",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  productEntity.discountedPrice == 0
                      ? ''
                      : "${productEntity.prices}\$",
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductImage() {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              productEntity.images[0],
            ),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
