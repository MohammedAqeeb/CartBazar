import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/authentication/domain/entity/user_info.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserInfoUsecase
    implements UseCase<Either<Failure, UserInfoEnity>, NoParam> {
  final AuthRepository authRepository;

  GetUserInfoUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserInfoEnity>> call({NoParam? params}) async {
    return await authRepository.getCurrentUserData();
  }
}
