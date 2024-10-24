import 'package:cart_bazar/core/common/app_bottom_sheet/select_age.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/bloc/size_cubit/selected_size.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/detail_screen/bottom_sheet/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedProductSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedProductSize({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.getSheet(
          context: context,
          widgets: BlocProvider.value(
            value: BlocProvider.of<SelectedSizeCubit>(context),
            child: ProductSizeBottomSheet(productEntity: productEntity),
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
                'Size',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              BlocBuilder<SelectedSizeCubit, int>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Text(
                        productEntity.sizes[state],
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
