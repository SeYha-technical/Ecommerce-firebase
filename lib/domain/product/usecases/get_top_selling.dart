import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/domain/product/repository/product.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';

class GetTopSellingUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getTopSell();
  }
}
