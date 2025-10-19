import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_bloc/domain/order/repository/order.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';

class AddToCartUseCase implements UseCase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return await sl<OrderRepository>().addToCart(params!);
  }
}
