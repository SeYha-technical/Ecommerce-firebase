import '../../../domain/auth/entities/user.dart';

abstract class UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserEntity user;
  UserProfileLoaded({required this.user});
}

class UserProfileFailure extends UserProfileState {}
