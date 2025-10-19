import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/data/product/sources/product_fire_service.dart';

import '../../../domain/product/repository/product.dart';
import '../../../presentation/service_locator.dart';
import '../model/product.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSell() async {
    var returnData = await sl<ProductFirebaseService>().getTopSell();
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getNewIn() async {
    var returnData = await sl<ProductFirebaseService>().getNewIn();
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    var returnedData = await sl<ProductFirebaseService>()
        .getProductByCategoryId(categoryId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> searchProductByTitle(String title) async {
    var returnedData = await sl<ProductFirebaseService>().searchProductByTitle(
      title,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
