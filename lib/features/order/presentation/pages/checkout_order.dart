import 'package:cart_bazar/core/common/cubit/submit_button/submit_button_cubit.dart';
import 'package:cart_bazar/core/common/helper/cart/checkout_price.dart';
import 'package:cart_bazar/core/common/widgets/button/submit_state_button.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/features/cart/domain/entity/product_cart_entity.dart';
import 'package:cart_bazar/features/order/data/models/order_placed.dart';
import 'package:cart_bazar/features/order/data/models/order_status.dart';
import 'package:cart_bazar/features/order/domain/usecase/order_place_usecase.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/navigator/app_navigator.dart';
import '../../../cart/data/models/product_cart.dart';
import 'order_placed_success.dart';

class CheckoutOrderScreen extends StatelessWidget {
  final List<ProductCartEntity> productCartEntity;
  CheckoutOrderScreen({super.key, required this.productCartEntity});

  final TextEditingController _addressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Checkout'),
      ),
      body: BlocListener<SubmitButtonCubit, SubimitButtonState>(
        listener: (context, state) {
          if (state is SubmitButtonSuccess) {
            AppNavigator.pushAndRemove(
                context, const OrderPlacedSuccessScreen());
          }
          if (state is SubmitButtonFailure) {
            var snackbar = SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAddressFiedl(),
              SubmitStateButton(
                content: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${CartCheckoutPriceHelper.calculateSubtotal(productCartEntity)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const Text(
                        'Place Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  if (_addressCon.text.isNotEmpty &&
                      _addressCon.text.length > 6) {
                    context.read<SubmitButtonCubit>().onButtonSubmit(
                          usecase: serviceLocator<OrderPlaceUsecase>(),
                          param: OrderPlaced(
                            orderId: '',
                            products: productCartEntity as List<ProductCart>,
                            createdDate: DateTime.now().toString(),
                            shippingAddress: _addressCon.text.trim(),
                            itemCount: productCartEntity.length,
                            totalPrice:
                                CartCheckoutPriceHelper.calculateSubtotal(
                                    productCartEntity),
                            orderStatus: [
                              OrderStatus(
                                title: 'Order Placed',
                                done: true,
                                createdDate: DateTime.now(),
                              ),
                              OrderStatus(
                                title: 'Order Confirmed',
                                done: false,
                                createdDate: DateTime.now(),
                              ),
                              OrderStatus(
                                title: 'Order Shipped',
                                done: false,
                                createdDate: DateTime.now(),
                              ),
                              OrderStatus(
                                title: 'Delivered',
                                done: false,
                                createdDate: DateTime.now(),
                              ),
                            ],
                          ),
                        );
                  } else {
                    var snackBar = const SnackBar(
                      content: Text('Enter valid address'),
                      behavior: SnackBarBehavior.floating,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressFiedl() {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(hintText: 'Shipping Address'),
    );
  }
}
