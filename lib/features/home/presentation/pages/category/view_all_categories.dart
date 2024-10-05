import 'package:cart_bazar/core/common/cubit/categories/categories_list_cubit.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/common/widgets/custom_appbar.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/categories_entity.dart';
import '../product/products_by_category.dart';

class ViewAllCategoriesScreen extends StatelessWidget {
  const ViewAllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBack: false),
      body: BlocProvider(
        create: (context) => serviceLocator<CategoriesListCubit>()..getList(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeadline(),
              const SizedBox(height: 18),
              _buildCategories(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesListState>(
        builder: (context, state) {
      if (state is CategoriesListSuccess) {
        return buildCategoryList(state);
      } else if (state is CategoriesListLoading) {
        return const CircularProgressIndicator();
      } else {
        return const SizedBox();
      }
    });
  }

  Widget buildCategoryList(CategoriesListSuccess state) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: state.categoriesEntity.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final category = state.categoriesEntity[index];
        return buildListPreview(context, category);
      },
    );
  }

  Widget buildListPreview(BuildContext context, CategoriesEntity category) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context, ProductsByCategoryScreen(categoriesEntity: category));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12),
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: AppPalletes.secondBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(category.image),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              category.categoryName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return const Text(
      'Shop by Categories',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}
