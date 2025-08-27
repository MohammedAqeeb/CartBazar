import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit_colors/selected_color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entity/product_color_entity.dart';

class ProductColorsBottomSheet extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductColorsBottomSheet({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppPalettes.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(22),
          topLeft: Radius.circular(22),
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
              'Color',
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
    return BlocBuilder<SelectedColorCubit, int>(
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final color = productEntity.colors[index];
            return selectedColors(context, color, state, index);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: productEntity.colors.length,
        );
      },
    );
  }

  Widget selectedColors(
      BuildContext context, ProductColorEntity color, int state, int index) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedColorCubit>().changeColor(index);
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
                  color.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(
                          color.rgb[0],
                          color.rgb[1],
                          color.rgb[2],
                          1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
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
