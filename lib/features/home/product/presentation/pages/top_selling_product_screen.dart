import 'package:cart_bazar/core/common/widgets/product/product_view.dart';

import 'package:cart_bazar/features/home/category/presentation/widgets/view_more.dart';
import 'package:cart_bazar/features/home/product/presentation/cubit/top_selling_cubit.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/product_entity.dart';

class TopSellingProductScreen extends StatelessWidget {
  const TopSellingProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<TopSellingCubit>()..getTopSellingProducts(),
      child: BlocBuilder<TopSellingCubit, TopSellingState>(
        builder: (context, state) {
          if (state is TopSellingLoadig) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TopSellingSuccess) {
            return Column(
              children: [
                ViewMoreButton(firstText: 'Top Selling', onTap: () {}),
                const SizedBox(height: 20),
                _buildTopSelling(state.topSellingProducts),
              ],
            );
          } else if (state is TopSellingFailure) {
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
            horizontal: 16,
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
