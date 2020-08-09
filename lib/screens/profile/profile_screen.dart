import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quick_learn/models/hive/user.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    box.p
    final UserProfile profile =
        Hive.box<UserProfile>('UserProfile').get('myProfile');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(profile.fullname),
            Text(profile.fullname),
          ],
        ),
      ),
    );
  }
}
