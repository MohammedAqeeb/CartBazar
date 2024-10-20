import 'package:cart_bazar/core/assets/app_vector.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/cart/presentation/widgets/cart_checkout.dart';
import 'package:cart_bazar/features/cart/presentation/widgets/product_cart_view.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entity/product_cart_entity.dart';
import '../cubit/product_cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ProductCartCubit>()..getCartProduct(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text('Cart'),
        ),
        body: BlocBuilder<ProductCartCubit, ProductCartState>(
          builder: (context, state) {
            if (state is ProductCartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductCartFailure) {
              return _buildEmptyCart();
            } else if (state is ProductCarttSuccess) {
              return state.product.isEmpty
                  ? _buildEmptyCart()
                  : Stack(
                      children: [
                        _buildListView(context, state.product),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CartCheckout(productCartEntity: state.product),
                        ),
                      ],
                    );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<ProductCartEntity> product) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final products = product[index];
        return ProductCartView(productCartEntity: products);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: product.length,
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVector.cartBag),
          const SizedBox(height: 14),
          const Text('Your Cart is Empty')
        ],
      ),
    );
  }
}
