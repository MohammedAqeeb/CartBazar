import 'package:cart_bazar/core/assets/app_vector.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/product_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/navigator/app_navigator.dart';

class OnTapSearchScreen extends StatelessWidget {
  const OnTapSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        onTap: () {
          AppNavigator.push(context, const ProductSearchScreen());
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
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
