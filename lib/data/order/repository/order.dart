import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_bloc/data/order/models/order_rigsteration.dart';
import 'package:ecommerce_bloc/data/order/models/product_order.dart';
import 'package:ecommerce_bloc/data/order/sources/order_firebase_service.dart';
import 'package:ecommerce_bloc/domain/order/repository/order.dart';

import '../../../presentation/service_locator.dart';
import '../models/order.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) {
    return sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCart() async {
    var cart = await sl<OrderFirebaseService>().getCart();
    return cart.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductOrderedModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> removeFromCart(String id) async {
    var returnData = await sl<OrderFirebaseService>().removeFromCart(id);
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var returnData = await sl<OrderFirebaseService>().orderRegistration(order);
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either> getOrder() async {
    var returnedData = await sl<OrderFirebaseService>().getOrder();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data).map((e) => OrderModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
