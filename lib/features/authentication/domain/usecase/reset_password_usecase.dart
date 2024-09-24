import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class ResetPasswordUseCase implements UseCase<Either, String> {
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});
  @override
  Future<Either> call({String? params}) async {
    return await authRepository.sendPasswordResetEmail(params!);
  }
}
