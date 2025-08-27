import 'package:cart_bazar/core/common/helper/date_helper.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_orders_entity.dart';
import 'package:flutter/material.dart';

import 'order_product_view.dart';

class OrderDetailPage extends StatelessWidget {
  final CompletedOrderEntity orderEntity;
  const OrderDetailPage({required this.orderEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(
              'Order #${orderEntity.orderId.substring(orderEntity.orderId.length - 4)}'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatus(),
              const SizedBox(height: 50),
              _buildItems(context),
              const SizedBox(height: 30),
              _buildShipping()
            ],
          ),
        ));
  }

  Widget _buildStatus() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: orderEntity.orderStatus[index].done
                        ? AppPalettes.primary
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: orderEntity.orderStatus[index].done
                      ? const Icon(Icons.check)
                      : Container(),
                ),
                const SizedBox(width: 15),
                Text(
                  orderEntity.orderStatus[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: orderEntity.orderStatus[index].done
                        ? Colors.white
                        : Colors.grey,
                  ),
                )
              ],
            ),
            Text(
              DateConverterHelper.formatDate(
                  orderEntity.orderStatus[index].createdDate),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: orderEntity.orderStatus[index].done
                    ? Colors.white
                    : Colors.grey,
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 50),
      reverse: true,
      itemCount: orderEntity.orderStatus.length,
    );
  }

  Widget _buildItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.push(
                context, OrderItemsPage(products: orderEntity.products));
          },
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppPalettes.secondBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_rounded),
                    const SizedBox(width: 20),
                    Text(
                      '${orderEntity.products.length} Items',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const Text(
                  'View All',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppPalettes.primary,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildShipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppPalettes.secondBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(orderEntity.shippingAddress),
        )
      ],
    );
  }
}
