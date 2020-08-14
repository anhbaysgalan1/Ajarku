import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quick_learn/helpers/firebase_helper.dart';
import 'package:quick_learn/screens/register_user/register_user.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Form(
          child: Column(
            children: [
              TextFormField(),
              TextFormField(),
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {
            FirebaseHelper().googleSignIn();
          },
          child: Text('Login'),
        ),
        RegisterUserScreen(),
      ],
    );
  }
}
