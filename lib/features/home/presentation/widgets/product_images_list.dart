import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductTitleImageScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitleImageScreen({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildImage(),
        buildTitle(),
        buildPrice(),
      ],
    );
  }

  Widget buildImage() {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final images = productEntity.images[index];
          return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: images,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: productEntity.images.length,
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 8),
      child: Text(
        productEntity.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildPrice() {
    return Text(
      "\$${productEntity.discountedPrice != 0 ?
        productEntity.discountedPrice.toString() : 
        productEntity.prices.toString()}",
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }
}
