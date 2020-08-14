part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthState {
  final LoginInputModel login;

  LogInEvent(this.login);
  @override
  List<Object> get props => [login];
}

class LogOutEvent extends AuthState {}

class RegisterEvent extends AuthState {
  final registerInput;

  RegisterEvent(this.registerInput);
  @override
  List<Object> get props => [registerInput];
}

class Virgin extends AuthState {}
