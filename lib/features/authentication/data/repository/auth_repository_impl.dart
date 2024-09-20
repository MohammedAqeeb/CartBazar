import 'package:cart_bazar/features/authentication/data/data_source/auth_service.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSourceService authDataSourceService;

  AuthRepositoryImpl({required this.authDataSourceService});

  @override
  Future<Either> createUser(OnBoardUser user) {
    return authDataSourceService.createUser(user);
  }

  @override
  Future<Either> getAgeRange() {
    return authDataSourceService.getAgeRange();
  }
}
