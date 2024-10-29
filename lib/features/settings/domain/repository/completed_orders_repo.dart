import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_orders_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CompletedOrdersRepository {
  Future<Either<Failure, List<CompletedOrderEntity>>> getOrdersStatusRepo();
}
