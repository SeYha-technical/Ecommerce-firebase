import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../repository/product.dart';

class SearchByTitleUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().searchProductByTitle(params!);
  }
}
