import 'package:cart_bazar/core/assets/app_images.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/settings/presentation/cubit/cubit/completed_orders_cubit.dart';
import 'package:cart_bazar/features/settings/presentation/widgets/order_summary.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/completed_orders_entity.dart';

class OrdersStatusScreen extends StatelessWidget {
  const OrdersStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Orders'),
      ),
      body: BlocProvider(
        create: (context) =>
            serviceLocator<CompletedOrdersCubit>()..getOrders(),
        child: BlocBuilder<CompletedOrdersCubit, CompletedOrdersState>(
          builder: (context, state) {
            if (state is CompletedOrdersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CompletedOrdersFailure) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is CompletedOrdersSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: [
                      _buildOrderList(context, state.orders),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildOrderList(
    BuildContext context,
    List<CompletedOrderEntity> orders,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final status = orders[index];
        return _buildOrdersPreview(context, status);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: orders.length,
    );
  }

  Widget _buildOrdersPreview(
      BuildContext context, CompletedOrderEntity status) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, OrderDetailPage(orderEntity: status));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: AppPalletes.secondBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(AppImages.receipt),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ord \t #${status.orderId.substring(status.orderId.length - 5)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ' ${status.products.length.toString()} Items',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppPalletes.hintTextColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(AppImages.arrowLogo)
          ],
        ),
      ),
    );
  }
}
