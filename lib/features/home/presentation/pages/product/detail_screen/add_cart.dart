import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/helper/product/product_price.dart';
import 'package:cart_bazar/core/common/widgets/button/submit_state_button.dart';
import 'package:cart_bazar/features/cart/presentation/pages/cart_page.dart';
import 'package:cart_bazar/features/home/domain/entity/product_entity.dart';
import 'package:cart_bazar/features/home/presentation/bloc/colors/selected_color_cubit.dart';
import 'package:cart_bazar/features/home/presentation/bloc/quantity/product_quantity_cubit.dart';
import 'package:cart_bazar/features/home/presentation/bloc/size/selected_size.dart';
import 'package:cart_bazar/features/order/data/models/carts.dart';
import 'package:cart_bazar/features/order/domain/usecase/add_to_cart_usecase.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCartButton extends StatelessWidget {
  final ProductEntity productEntity;
  const AddCartButton({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitButtonCubit, SubimitButtonState>(
      listener: (context, state) {
        if (state is SubmitButtonSuccess) {
          AppNavigator.push(context, const CartPage());
        } else if (state is SubmitButtonFailure) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SubmitStateButton(
          onPressed: () {
            context.read<SubmitButtonCubit>().onButtonSubmit(
                  usecase: AddToCartUsecase(
                    orderRepository: serviceLocator(),
                  ),
                  param: Carts(
                    cartId: '',
                    productId: productEntity.productId,
                    productTitle: productEntity.title,
                    productQuantity: context.read<ProductQuantityCubit>().state,
                    productColor: productEntity
                        .colors[
                            context.read<SelectedColorCubit>().selectedIndex]
                        .title,
                    productSize: productEntity
                        .sizes[context.read<SelectedSizeCubit>().selectedSize],
                    productPrice: productEntity.prices.toDouble(),
                    totalPrice:
                        ProductPriceHelper.provideCurrentPrice(productEntity) *
                            context.read<ProductQuantityCubit>().state,
                    productImage: productEntity.images[0],
                    createdDate: DateTime.now().toString(),
                  ),
                );
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  var price =
                      ProductPriceHelper.provideCurrentPrice(productEntity) *
                          state;
                  return Text(
                    "\$${price.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                  );
                },
              ),
              const Text(
                'Add to Bag',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
