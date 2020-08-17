import 'package:equatable/equatable.dart';

class LoginInputModel extends Equatable {
  final String username;
  final String password;

  LoginInputModel({this.username, this.password});

  LoginInputModel copyWith({username, password}) {
    return LoginInputModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
