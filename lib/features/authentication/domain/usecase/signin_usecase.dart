import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/authentication/data/models/user_sign_in.dart';
import 'package:fpdart/fpdart.dart';

import '../repository/auth_repository.dart';

class SignInUsecase implements UseCase<Either, UserSignIn> {
  final AuthRepository authRepository;

  SignInUsecase({required this.authRepository});

  @override
  Future<Either> call({UserSignIn? params}) async{
    return await authRepository.signInWithEmailAndPassword(params!);
  }
}
