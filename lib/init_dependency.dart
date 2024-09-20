import 'package:cart_bazar/features/authentication/data/data_source/auth_service.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/age_range_usecase.dart';
import 'package:cart_bazar/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/get_age_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/data/repository/auth_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizedDependency() async {
  // services
}

void signUpDependency() {
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
    // Use Case Dependency
    ..registerSingleton(
      SignupUseCase(
        authRepository: serviceLocator(),
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
