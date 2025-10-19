import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../ropository/auth/auth.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getUser();
  }
}
