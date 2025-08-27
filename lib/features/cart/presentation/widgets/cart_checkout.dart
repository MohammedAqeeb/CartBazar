import 'package:cart_bazar/core/common/helper/cart/checkout_price.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/button/rounded_button.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/order/presentation/pages/checkout_order.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/product_cart_entity.dart';

class CartCheckout extends StatelessWidget {
  final List<ProductCartEntity> productCartEntity;
  const CartCheckout({
    super.key,
    required this.productCartEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppPalettes.background,
      child: Column(
        children: [
          buildRowText(
            'Subtotals',
            '\$ ${CartCheckoutPriceHelper.calculateSubtotal(productCartEntity).toString()}',
          ),
          const SizedBox(height: 12),
          buildRowText('Shipping Cost', '\$10.0'),
          const SizedBox(height: 12),
          buildRowText('Tax', '\$0.0'),
          const SizedBox(height: 12),
          buildRowText('Total',
              '\$ ${CartCheckoutPriceHelper.calculateSubtotal(productCartEntity) + 10.0}'),
          const SizedBox(height: 12),
          const Spacer(),
          RoundedButton(
            onPressed: () {
              AppNavigator.push(
                context,
                CheckoutOrderScreen(
                  productCartEntity: productCartEntity,
                ),
              );
            },
            content: const Text(
              'Checkout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget buildRowText(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
