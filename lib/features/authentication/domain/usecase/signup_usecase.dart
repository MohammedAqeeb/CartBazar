import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/authentication/data/models/board_user.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignupUseCase implements UseCase<Either, OnBoardUser> {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});
  @override
  Future<Either> call({OnBoardUser? params}) async {
    return await authRepository.createUser(params!);
  }
}
