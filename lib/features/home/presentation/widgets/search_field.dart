import 'package:cart_bazar/core/assets/app_vector.dart';
import 'package:cart_bazar/features/home/presentation/bloc/product_cubit/product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: textEditingController,
        onChanged: (value) {
          if (value.isEmpty && value.length < 3) {
            context.read<ProductsDisplayCubit>().displayInitialState();
          } else {
            context.read<ProductsDisplayCubit>().getProducts(params: value);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: SvgPicture.asset(
            AppVector.search,
            fit: BoxFit.none,
          ),
          hintText: 'search',
        ),
      ),
    );
  }
}
