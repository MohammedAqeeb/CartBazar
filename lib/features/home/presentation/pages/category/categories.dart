import 'package:cart_bazar/core/common/cubit/categories/categories_list_cubit.dart';
import 'package:cart_bazar/core/common/navigator/app_navigator.dart';
import 'package:cart_bazar/core/theme/app_palletes.dart';
import 'package:cart_bazar/features/home/domain/entity/categories_entity.dart';
import 'package:cart_bazar/features/home/presentation/widgets/view_more.dart';
import 'package:cart_bazar/features/home/presentation/pages/category/view_all_categories.dart';
import 'package:cart_bazar/init_dependency.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CategoriesListCubit>()..getList(),
      child: BlocBuilder<CategoriesListCubit, CategoriesListState>(
        builder: (context, state) {
          if (state is CategoriesListLoading) {
            // return buildLoader();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesListSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  ViewMoreButton(
                    firstText: 'Categories',
                    onTap: () {
                      AppNavigator.push(
                          context, const ViewAllCategoriesScreen());
                    },
                  ),
                  const SizedBox(height: 20),
                  buildCategories(context, state.categoriesEntity),
                ],
              ),
            );
          } else if (state is CategoriesListFailure) {
            return Text(state.errorMessage);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget buildCategories(
    BuildContext context,
    List<CategoriesEntity> categoriesEntity,
  ) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: ((context, index) => const SizedBox(
              width: 15,
            )),
        itemCount: categoriesEntity.length,
        itemBuilder: ((context, index) {
          final category = categoriesEntity[index];
          return Column(
            children: [
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(category.image),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                category.categoryName,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget buildLoader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Shimmer.fromColors(
        baseColor: AppPalletes.hintTextColor,
        highlightColor: AppPalletes.offWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 4; i++)
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppPalletes.hintTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 15,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
