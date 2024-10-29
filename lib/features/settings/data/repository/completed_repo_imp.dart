import 'package:cart_bazar/core/error/failure.dart';
import 'package:cart_bazar/features/settings/data/data_source/completed_orders_source.dart';
import 'package:cart_bazar/features/settings/domain/entity/completed_orders_entity.dart';
import 'package:cart_bazar/features/settings/domain/repository/completed_orders_repo.dart';
import 'package:fpdart/fpdart.dart';

class CompletedOrdersRepoImp implements CompletedOrdersRepository {
  final CompletedOrdersDataSource completedOrdersDataSource;

  CompletedOrdersRepoImp({required this.completedOrdersDataSource});
  @override
  Future<Either<Failure, List<CompletedOrderEntity>>>
      getOrdersStatusRepo() async {
    return await completedOrdersDataSource.getOrderStatus();
  }
}
