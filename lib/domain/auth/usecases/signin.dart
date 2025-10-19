import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecases.dart';
import '../../../data/auth/model/user_sigin_req.dart';
import '../../../presentation/service_locator.dart';
import '../ropository/auth/auth.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
