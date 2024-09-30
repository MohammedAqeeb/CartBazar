import 'package:cart_bazar/features/home/home_presentation/widgets/header.dart';
import 'package:cart_bazar/features/home/home_presentation/widgets/search_field.dart';
import 'package:cart_bazar/features/home/product/presentation/pages/top_selling_product_screen.dart';
import 'package:flutter/material.dart';

import '../category/presentation/pages/categories.dart';

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
            SearchField(),
            SizedBox(height: 24),
            CategoriesScreen(),
            SizedBox(height: 24),
            TopSellingProductScreen()
          ],
        ),
      ),
    );
  }
}


// ElevatedButton(
//                 onPressed: () {
//                   ProductDataSourceImp imp = ProductDataSourceImp();
//                   imp.getNewArrivalProducts();
//                 },
//                 child: const Text('ADD PRODUCTS')),