import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:quick_learn/models/hive/user/user.dart';
import 'package:quick_learn/widgets/upload_course.dart';
import '../profile/profile_screen.dart';

class HomepageScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
          
    final singleChildScrollController = useScrollController();

    final tickerProvider = useSingleTickerProvider();
    final tabController =
        useTabController(initialLength: 3, vsync: tickerProvider);
    return TabBarView(
          controller: tabController,
          children: [
            SingleChildScrollView(
              controller: singleChildScrollController,
              child: Container(
                width: 300,
                color: Colors.blue,
                child: Column(
                  children: [
                    Text('1'),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    UploadCourse(),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              color: Colors.green,
              child: Text('2'),
            ),
            Container(
              width: 300,
              color: Colors.amber,
              child: Text('3'),
            ),
          ],
        );}
}
