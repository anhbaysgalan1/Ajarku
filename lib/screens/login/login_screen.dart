import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quick_learn/bloc/auth/auth_bloc.dart';
import 'package:quick_learn/models/users/login_input.dart';
import 'package:quick_learn/screens/register_user/register_user.dart';

class LoginScreen extends HookWidget {
  final formController = GlobalKey<FormState>();
  LoginInputModel _login = LoginInputModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(),
              Form(
                key: formController,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'email',
                      ),
                      onSaved: (val) {
                        _login = _login.copyWith(username: val);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'password',
                      ),
                      onSaved: (val) {
                        _login = _login.copyWith(password: val);
                      },
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  formController.currentState.save();
                  print(_login.username);
                  print(_login.password);
                  BlocProvider.of<AuthBloc>(context).add(
                    LoginEmailEvent(login: _login),
                  );
//                  FirebaseHelper().googleSignIn();
                },
                child: Text('Login'),
              ),
              RegisterUserScreen(),
            ],
          ),
        );
      },
    );
  }
}
