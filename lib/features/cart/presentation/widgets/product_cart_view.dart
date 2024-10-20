import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:cart_bazar/features/cart/presentation/cubit/product_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_palletes.dart';

class ProductCartView extends StatelessWidget {
  final ProductCartEntity productCartEntity;
  const ProductCartView({
    super.key,
    required this.productCartEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppPalletes.secondBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProductImage(),
            const SizedBox(width: 10),
            buildProductTitle(),
            Expanded(child: Container()),
            buildProductPrice(context)
          ],
        ),
      ),
    );
  }

  Widget buildProductImage() {
    return Expanded(
      flex: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                      productCartEntity.productImage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          productCartEntity.productTitle,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text.rich(
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: 'Size - ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
                children: [
                  TextSpan(
                    text: productCartEntity.productSize,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text.rich(
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: 'Color - ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
                children: [
                  TextSpan(
                    text: productCartEntity.productColor,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildProductPrice(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${productCartEntity.totalPrice}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  context
                      .read<ProductCartCubit>()
                      .removeCartProduct(productCartEntity.cartId);
                },
                child: Container(
                  height: 23,
                  width: 23,
                  decoration: const BoxDecoration(
                    color: AppPalletes.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
