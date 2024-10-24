import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/quantity_cubit/product_quantity_cubit.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              'Quantity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ProductQuantityCubit>().decrement();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppPalletes.primary,
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),
                BlocBuilder<ProductQuantityCubit, int>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        state.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ProductQuantityCubit>().increment();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppPalletes.primary,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
