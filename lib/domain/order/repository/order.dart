import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/data/order/models/add_to_card_req.dart';
import 'package:ecommerce_bloc/data/order/models/order_rigsteration.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCart();
  Future<Either> removeFromCart(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  Future<Either> getOrder();
}
