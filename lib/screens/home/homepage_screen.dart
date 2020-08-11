import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:quick_learn/models/hive/user/user.dart';
import '../profile/profile_screen.dart';

class HomepageScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
        IconButton(
          padding: EdgeInsets.all(20),
          icon: Icon(Icons.person),
          onPressed: () {
            Hive.box<UserProfile>('userProfile').put(
              'myProfile',
              UserProfile(
                username: 'rifky',
                email: 'rifkyadp@gmail.com',
                fullname: 'rifky adni',
                points: '20',
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
