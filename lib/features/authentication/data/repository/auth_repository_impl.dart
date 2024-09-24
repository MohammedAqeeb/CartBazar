import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/authentication/data/data_source/auth_service.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cart_bazar/features/authentication/data/models/user_sign_in.dart';
import 'package:cart_bazar/features/authentication/domain/entity/user_info.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSourceService authDataSourceService;

  AuthRepositoryImpl({required this.authDataSourceService});

  @override
  Future<Either> createUser(OnBoardUser user) async {
    return await authDataSourceService.createUser(user);
  }

  @override
  Future<Either> getAgeRange() async {
    return await authDataSourceService.getAgeRange();
  }

  @override
  Future<Either> signInWithEmailAndPassword(UserSignIn signIn) async {
    return await authDataSourceService.signInUser(signIn);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await authDataSourceService.sendPasswordReset(email);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await authDataSourceService.isUserLoggedIn();
  }

  @override
  Future<Either<Failure, UserInfoEnity>> getCurrentUserData() async {
    final userInfo = await authDataSourceService.getCurrentUserInfo();

    return userInfo.fold(
      (error) => Left(error),
      (userData) => Right(userData),
    );
  }
}
