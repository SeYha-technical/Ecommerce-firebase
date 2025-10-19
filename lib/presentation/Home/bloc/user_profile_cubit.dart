import 'package:ecommerce_bloc/presentation/Home/bloc/user_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/auth/usecases/get_user.dart';
import '../../service_locator.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileLoading());
  void displayUserProfile() async {
    var returnData = await sl<GetUserUseCase>().call();
    returnData.fold(
      (error) {
        emit(UserProfileFailure());
      },
      (data) {
        emit(UserProfileLoaded(user: data));
      },
    );
  }
}
