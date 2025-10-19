import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/add_to_card_req.dart';
import '../models/order_rigsteration.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCart();
  Future<Either> removeFromCart(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  Future<Either> getOrder();
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCartReq.toMap());
      return Right('add to cart successfully');
    } catch (e) {
      return Left('Cart Not Found ');
    }
  }

  @override
  Future<Either> getCart() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .get();
      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return Left('Cart Not Found ');
    }
  }

  @override
  Future<Either> removeFromCart(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();
      return Right('product remove successful');
    } catch (e) {
      return Left('false to remove from cart ');
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Orders')
          .add(order.toMap());
      for (var item in order.products) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }

      return Right('order  successful');
    } catch (e) {
      return Left('false to remove from cart ');
    }
  }

  @override
  Future<Either> getOrder() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection('Orders')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
