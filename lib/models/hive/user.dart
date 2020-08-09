import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserProfile extends Equatable {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String fullname;

  @HiveField(3)
  final String points;

  UserProfile({this.username, this.email, this.fullname, this.points});

  @override
  // TODO: implement props
  List<Object> get props => [];
}
