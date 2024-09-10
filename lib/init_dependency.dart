import 'package:cart_bazar/features/authentication/data/data_source/auth_service.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/data/repository/auth_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizedDependency() async {
  //services
  serviceLocator.registerSingleton(
    AuthDataSourceServiceImpl(),
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
}
