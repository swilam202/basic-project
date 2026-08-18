
part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginFailure extends LoginState {
  final Failure failure;
  LoginFailure(this.failure);
}
