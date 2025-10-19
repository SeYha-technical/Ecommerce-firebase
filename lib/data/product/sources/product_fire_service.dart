import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSell();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoryId(String categoryId);
  Future<Either> searchProductByTitle(String title);
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSell() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('saleNumber', isGreaterThanOrEqualTo: 20)
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Data not found');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'createdDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(2025, 10, 13)),
          )
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Data not found');
    }
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Data not found');
    }
  }

  @override
  Future<Either> searchProductByTitle(String title) async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Data not found');
    }
  }
}
