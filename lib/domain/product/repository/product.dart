import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either> getTopSell();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoryId(String categoryId);
  Future<Either> searchProductByTitle(String title);
}
