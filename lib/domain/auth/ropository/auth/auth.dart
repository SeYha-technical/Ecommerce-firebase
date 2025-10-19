import 'package:dartz/dartz.dart';

import '../../../../data/auth/model/use_crete_req.dart';
import '../../../../data/auth/model/user_sigin_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> SendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
