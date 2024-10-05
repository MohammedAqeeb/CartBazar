import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class SelectedProductSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedProductSize({
    super.key,
    required this.productEntity,
  });

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  'S',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
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
