import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cart_bazar/features/authentication/data/models/user_sign_in.dart';
import 'package:cart_bazar/features/authentication/domain/entity/user_info.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either> createUser(OnBoardUser user);
  Future<Either> getAgeRange();
  Future<Either> signInWithEmailAndPassword(UserSignIn signIn);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isUserLoggedIn();

  Future<Either<Failure, UserInfoEnity>> getCurrentUserData();
}
