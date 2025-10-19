import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../repository/order.dart';

class RemoveFromCartUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<OrderRepository>().removeFromCart(params!);
  }
}
