import 'package:flutter/material.dart';
import 'package:quick_learn/helpers/firebase_helper.dart';

class RegisterUserScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String user = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (val) => user = val,
              ),
              TextFormField(
                onSaved: (val) => password = val,
              ),
              MaterialButton(
                child: Text('register'),
                onPressed: () async {
                  formKey.currentState.validate();
                  formKey.currentState.save();
                  print(user);
                  print(password);
                  final newUser =
                      await FirebaseHelper().createNewAccount(user, password);
                  print(newUser.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
