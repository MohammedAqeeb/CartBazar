import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/size_cubit/selected_size.dart';

class ProductSizeBottomSheet extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizeBottomSheet({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      decoration: const BoxDecoration(
        color: AppPalettes.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: Column(
        children: [
          buildTitle(context),
          const SizedBox(height: 40),
          buildColorsList(context),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 24, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
            child: Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget buildColorsList(BuildContext context) {
    return BlocBuilder<SelectedSizeCubit, int>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final sizes = productEntity.sizes[index];
            return selectedColors(context, sizes, state, index);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: productEntity.colors.length,
        );
      },
    );
  }

  Widget selectedColors(
      BuildContext context, String sizes, int state, int index) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedSizeCubit>().selectSize(index);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 12),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: state == index
                ? AppPalettes.primary
                : AppPalettes.secondBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sizes,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    state == index
                        ? const Icon(Icons.check_outlined)
                        : const SizedBox(width: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
