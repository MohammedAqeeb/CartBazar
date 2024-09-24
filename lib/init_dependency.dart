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
import 'package:cart_bazar/features/home/presentation/bloc/cubit/get_user_info_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/data/repository/auth_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizedDependency() async {
  _signUpDependency();
  _categoryDependecy();
}

void _signUpDependency() {
  // data source Dependency
  serviceLocator
    ..registerSingleton<AuthDataSourceService>(
      AuthDataSourceServiceImpl(),
    )
    // authRepository Dependency
    ..registerSingleton<AuthRepository>(
      AuthRepositoryImpl(
        authDataSourceService: serviceLocator(),
      ),
    )
    // SignUp Use Case Dependency
    ..registerSingleton(
      SignupUseCase(
        authRepository: serviceLocator(),
      ),
    ) // SignIn Use Case Dependency
    ..registerSingleton(
      SignInUsecase(
        authRepository: serviceLocator(),
      ),
    ) // reset password Use Case Dependency
    ..registerSingleton(
      ResetPasswordUseCase(
        authRepository: serviceLocator(),
      ),
    ) // usecase for checking user logged in or not
    ..registerSingleton<LoggedInUserUseCase>(
      LoggedInUserUseCase(
        authRepository: serviceLocator(),
      ),
    ) // usecase for fetching userdata to display on homescreen
    ..registerSingleton<GetUserInfoUsecase>(
      GetUserInfoUsecase(
        authRepository: serviceLocator(),
      ),
    ) // cubit for fetching userdata to display on homescreen
    ..registerSingleton<GetUserInfoCubit>(
      GetUserInfoCubit(
        getUserInfoUsecase: serviceLocator(),
      ),
    )

    // Get Age Use Case Dependency
    ..registerSingleton<AgeRangeUseCase>(
      AgeRangeUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerSingleton<GetAgeCubit>(
      GetAgeCubit(ageUseCase: serviceLocator()),
    );
}

void _categoryDependecy() {
  // data source
  serviceLocator
    ..registerSingleton<CategoriesDataSource>(
      CategoriesDataSourceImp(),
    )
  // repository
    ..registerSingleton<CategoryRepository>(
      CategoryRepositoryImp(
        categoriesDataSource: serviceLocator(),
      ),
    )
  // usecase
    ..registerSingleton(
      CategoryUseCase(
        categoryRepository: serviceLocator(),
      ),
    )
  // cubit
    ..registerSingleton(
      CategoriesListCubit(
        useCase: serviceLocator(),
      ),
    );
}
