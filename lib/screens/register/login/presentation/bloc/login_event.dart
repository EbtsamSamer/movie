part of 'login_bloc.dart';

abstract class LoginEvent {}
class SignInRequested extends LoginEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

class SignOutRequested extends LoginEvent {}