import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:flutter/material.dart';

import '../../../cart/presentation/widgets/product_cart_view.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductCartEntity> products;
  const OrderItemsPage({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Text('Order Items'),
        ),
        body: _products());
  }

  Widget _products() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductCartView(
          productCartEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: products.length,
    );
  }
}
