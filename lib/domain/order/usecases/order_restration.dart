import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/data/order/models/order_rigsteration.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../repository/order.dart';

class OrderRegistrationUseCase
    implements UseCase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return await sl<OrderRepository>().orderRegistration(params!);
  }
}
