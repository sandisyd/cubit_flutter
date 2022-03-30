part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoding extends LoginState {}

class LoginError extends LoginState {
  final String? message;
  LoginError(this.message);
}

class LoginSuccess extends LoginState {
  final RessLogin? resLogin;
  LoginSuccess(this.resLogin);
}

class LoginFailed extends LoginState {
  final String? message;
  LoginFailed(this.message);
}
