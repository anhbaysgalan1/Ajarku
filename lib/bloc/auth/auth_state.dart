part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoggedIn extends AuthState {
  final loginData;

  LoggedIn({this.loginData});
  @override
  List<Object> get props => [loginData];
}

class LoggedOut extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {}
