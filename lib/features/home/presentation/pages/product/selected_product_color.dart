import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class SelectedProductColor extends StatelessWidget {
  final ProductEntity products;
  const SelectedProductColor({super.key, required this.products});

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
              'Color',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(1, 4, 5, 1),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
