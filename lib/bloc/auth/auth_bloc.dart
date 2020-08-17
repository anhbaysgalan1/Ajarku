import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:quick_learn/utils/error_helper.dart';
import 'package:quick_learn/utils/firebase_helper.dart';
import 'package:quick_learn/models/users/login_input.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  final authBox = Hive.lazyBox('authBox');

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthInit) {
      yield* _mapEventToStateAuthInitial();
    } else if (event is LoginEmailEvent) {
      yield* _mapEventToStateLogInEmailEvent(
        username: event.login.username,
        password: event.login.password,
      );
    } else if (event is LogOutEvent) {
      yield* _mapEventToStateLogOutEvent();
    }
  }

  Stream<AuthState> _mapEventToStateLogOutEvent() async* {
    FirebaseHelper.firebaseLogOut();
    yield Unauthenticated();
  }

  Stream<AuthState> _mapEventToStateAuthInitial() async* {
    final token = await authBox.get('token');
    if (token == null)
      yield Unauthenticated();
    else
      yield Authenticated();
  }

  Stream<AuthState> _mapEventToStateLogInEmailEvent({
    String username,
    String password,
  }) async* {
    AuthResult login;

    try {
      login = await FirebaseHelper().emailLogin(username, password);
    } on PlatformException catch (e) {
      ErrorHelper.console(
        errorHeader: 'PLATFORM EXCEPTION',
        errorCode: e.code,
        errorDetail: e.details,
        errorMessage: e.message,
      );
      return;
    } catch (e) {
      ErrorHelper.console(
        errorHeader: 'UNKNOWN ERROR',
//        errorCode: e.code? '',
//        errorDetail: e.details,
        errorMessage: e.toString(),
      );
      return;
    }

    final token = (await FirebaseHelper.checkFirebaseToken()).token;

    authBox.put('token', token);

    yield LoggedIn(loginData: login);
    print(login.user.providerData.toString());
    print(login.additionalUserInfo.toString());

//    print(login);
  }
}
