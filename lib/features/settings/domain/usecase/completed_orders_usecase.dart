import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/core/usecase/use_case.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_orders_entity.dart';
import 'package:cart_bazar/features/settings/domain/repository/completed_orders_repo.dart';
import 'package:fpdart/fpdart.dart';

class CompletedOrdersUsecase
    implements UseCase<Either<Failure, List<CompletedOrderEntity>>, String> {
  final CompletedOrdersRepository completedOrdersRepository;

  CompletedOrdersUsecase({required this.completedOrdersRepository});
  @override
  Future<Either<Failure, List<CompletedOrderEntity>>> call(
      {String? params}) async {
    return await completedOrdersRepository.getOrdersStatusRepo();
  }
}
