import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either> createUser(OnBoardUser user);
  Future<Either> getAgeRange();
}
