import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quick_learn/bloc/auth/auth_bloc.dart';
import 'package:quick_learn/router.dart';

class RootApp extends HookWidget {
  final router = Router();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc()..add(AuthInit()),
      child: MaterialApp(
        title: 'Ajarku',
        initialRoute: 'login',
        onGenerateRoute: router.onGenerateRoute,
        home: Scaffold(
          drawer: Drawer(
            child: Container(
              width: 200,
              child: Column(
                children: [
                  DrawerHeader(
                    child: FlutterLogo(),
                  ),
                  Text('Hi'),
                ],
              ),
            ),
          ),

//        body: LoginScreen(),
        ),
      ),
    );
  }
}
