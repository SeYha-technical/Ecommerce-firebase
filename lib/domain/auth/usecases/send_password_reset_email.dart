import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../ropository/auth/auth.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return sl<AuthRepository>().SendPasswordResetEmail(params!);
  }
}
