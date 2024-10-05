import 'package:cart_bazar/features/home/presentation/widgets/header.dart';
import 'package:cart_bazar/features/home/presentation/widgets/on_tap_search.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/new_arrival_product_screen.dart';
import 'package:cart_bazar/features/home/presentation/pages/product/top_selling_product_screen.dart';
import 'package:flutter/material.dart';

import 'pages/category/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height: 24),
            OnTapSearchScreen(),
            SizedBox(height: 24),
            CategoriesScreen(),
            SizedBox(height: 24),
            TopSellingProductScreen(),
            SizedBox(height: 24),
            NewArrivalProductScreen(),
          ],
        ),
      ),
    );
  }
}
            // ElevatedButton(
            //     onPressed: () {
            //       ProductDataSourceImp imp = ProductDataSourceImp();
            //       imp.searchProduct('jacket');
            //     },
            //     child: const Text('ADD PRODUCTS')),
