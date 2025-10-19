import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/domain/categories/repository/categories.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';

class CategoryUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
