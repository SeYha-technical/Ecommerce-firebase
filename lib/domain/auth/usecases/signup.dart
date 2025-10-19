import 'package:dartz/dartz.dart';
import 'package:ecommerce_bloc/core/usecases/usecases.dart';

import '../../../data/auth/model/use_crete_req.dart';
import '../../../presentation/service_locator.dart';
import '../ropository/auth/auth.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
