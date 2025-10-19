import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/data/categories/model/cateories.dart';
import 'package:ecommerce_bloc/data/categories/sources/get_categories_service.dart';
import 'package:ecommerce_bloc/domain/categories/repository/categories.dart';

import '../../../presentation/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => CategoryModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
