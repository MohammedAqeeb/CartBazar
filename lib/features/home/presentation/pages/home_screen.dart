import 'package:cart_bazar/features/home/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../widgets/search_field.dart';

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
          ],
        ),
      ),
    );
  }
}
