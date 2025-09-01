part of 'login_bloc.dart';

enum RequestState { init, loading, success, error }

abstract class LoginState {
  final RequestState requestState;
  const LoginState(this.requestState);
}

class AuthInitial extends LoginState {
  AuthInitial() : super(RequestState.init);
}
class AuthLoading extends LoginState {
  AuthLoading() : super(RequestState.loading);
}
class AuthSuccess extends LoginState {
  final String userEmail;
  AuthSuccess(this.userEmail) : super(RequestState.success);
}
class AuthFailure extends LoginState {
  final String message;
  AuthFailure(this.message) : super(RequestState.error);
}