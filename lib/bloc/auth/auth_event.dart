part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInit extends AuthEvent {}

class LoginEmailEvent extends AuthEvent {
  final LoginInputModel login;

  LoginEmailEvent({this.login});

  @override
  List<Object> get props => [login];
}

class LoginGoogleEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final registerInput;

  RegisterEvent({this.registerInput});
  @override
  List<Object> get props => [registerInput];
}

class FirstTime extends AuthEvent {}
