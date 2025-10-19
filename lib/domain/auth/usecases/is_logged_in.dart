import '../../../core/usecases/usecases.dart';
import '../../../presentation/service_locator.dart';
import '../ropository/auth/auth.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) {
    return sl<AuthRepository>().isLoggedIn();
  }
}
