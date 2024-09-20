import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AgeRangeUseCase implements UseCase<Either, NoParam> {
  final AuthRepository repository;

  AgeRangeUseCase({required this.repository});
  @override
  Future<Either> call({NoParam? params}) async {
    return await repository.getAgeRange();
  }
}
