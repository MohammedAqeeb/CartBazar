import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';

class LoggedInUserUseCase implements UseCase<bool, dynamic> { 
  final AuthRepository authRepository;

  LoggedInUserUseCase({required this.authRepository});
  @override
  Future<bool> call({params}) async {
    return await authRepository.isUserLoggedIn();
  }
}
