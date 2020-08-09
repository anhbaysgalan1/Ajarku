import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quick_learn/bloc/bottom_navbar/bottom_navbar_bloc.dart';

class BottomNavBarPrimary extends HookWidget {
  final tabCtrl;

  BottomNavBarPrimary({this.tabCtrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: TabBar(
        controller: tabCtrl,
        labelColor: Colors.white,
        indicatorColor: Colors.black26,
        indicatorPadding: EdgeInsets.only(left: 10),
        indicatorWeight: 5,
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.fromLTRB(0, 0, 10, 50),
        ),
        tabs: [
          Tab(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Text('Home'),
              ],
            ),
          ),
          Tab(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.all_inclusive),
                Text('My Courses'),
              ],
            ),
          ),
          Tab(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.person),
                Text('Social'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
