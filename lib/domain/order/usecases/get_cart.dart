import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../repository/order.dart';

class GetCartUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<OrderRepository>().getCart();
  }
}
