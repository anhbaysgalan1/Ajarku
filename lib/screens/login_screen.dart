import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
          child: Text('Login'),
        )
      ],
    );
  }
}
