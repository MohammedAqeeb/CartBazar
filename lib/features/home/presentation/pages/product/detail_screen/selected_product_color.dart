import 'package:cart_bazar/core/common/app_bottom_sheet/select_age.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit_colors/selected_color_cubit.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/detail_screen/bottom_sheet/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedProductColor extends StatelessWidget {
  final ProductEntity products;
  const SelectedProductColor({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.getSheet(
          context: context,
          widgets: BlocProvider.value(
            value: BlocProvider.of<SelectedColorCubit>(context),
            child: ProductColorsBottomSheet(
              productEntity: products,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(left: 18, right: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppPalletes.secondBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Color',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  BlocBuilder<SelectedColorCubit, int>(
                    builder: (context, state) {
                      return Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(
                            products.colors[state].rgb[0],
                            products.colors[state].rgb[1],
                            products.colors[state].rgb[2],
                            1,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
