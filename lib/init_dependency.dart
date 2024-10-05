import 'package:cart_bazar/core/common/cubit/categories/categories_list_cubit.dart';
import 'package:cart_bazar/features/authentication/data/data_source/auth_service.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/age_range_usecase.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/get_user_info_usecase.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/logged_in_user_usecase.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/signin_usecase.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/get_age_cubit.dart';
import 'package:cart_bazar/features/home/data/data_source/categories_data_source.dart';
import 'package:cart_bazar/features/home/data/repository/category_repo_imp.dart';
import 'package:cart_bazar/features/home/domain/repository/category_repository.dart';
import 'package:cart_bazar/features/home/domain/usecase/category_use_case.dart';
import 'package:cart_bazar/features/home/domain/usecase/search_product_usecase.dart';
import 'package:cart_bazar/features/home/presentation/bloc/cubit/get_user_info_cubit.dart';
import 'package:cart_bazar/features/home/data/data_source/product_data_source.dart';
import 'package:cart_bazar/features/home/data/repository/get_products_repo_impl.dart';
import 'package:cart_bazar/features/home/domain/repository/get_products_repo.dart';
import 'package:cart_bazar/features/home/domain/usecase/new_products_usecase.dart';
import 'package:cart_bazar/features/home/domain/usecase/product_by_category_usecase.dart';
import 'package:cart_bazar/features/home/domain/usecase/top_selling_usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/data/repository/auth_repository_impl.dart';

part 'init_dependency_main.dart';
