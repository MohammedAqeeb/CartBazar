import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit/favorite_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/product_entity.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoriteButton({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteProductCubit>().addFavoriteProduct(productEntity);
      },
      icon: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: AppPalettes.secondBackground,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteProductCubit, bool>(
          builder: (context, state) => Icon(
            state == true ? Icons.favorite : Icons.favorite_outline,
            size: state == true ? 18 : 15,
            color: state == true ? Colors.red : Colors.white,
          ),
        ),
      ),
    );
  }
}
