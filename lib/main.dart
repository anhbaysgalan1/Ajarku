import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_learn/bloc/bottom_navbar/bottom_navbar_bloc.dart';
import 'package:quick_learn/models/hive/user.dart';
import 'package:quick_learn/screens/home/homepage_screen.dart';
import 'package:quick_learn/widgets/bottom_nav_bar_primary.dart';

main() async {
//  Hive
  await Hive.initFlutter();
  Hive.registerAdapter<UserProfile>(UserProfileAdapter());
  await Hive.openBox<UserProfile>('userProfile');
  runApp(QuickLearnApp());
}

class QuickLearnApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final singleChildScrollController = useScrollController();
    final showFloating = useState(true);
    singleChildScrollController.addListener(() {
      if (singleChildScrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showFloating.value = false;
        print('kebawah');
      } else {
        showFloating.value = true;

        print('keatas');
      }
    });
    final tickerProvider = useSingleTickerProvider();
    final tabController =
        useTabController(initialLength: 3, vsync: tickerProvider);
    return MaterialApp(
      title: 'Material App',
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
        bottomNavigationBar: BottomNavBarPrimary(
          tabCtrl: tabController,
        ),
        floatingActionButton: Opacity(
          opacity: showFloating.value ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
        body: TabBarView(
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
                    showFloating.value
                        ? Text('ditampilkan')
                        : Text('disembunyikan'),
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
        ),
      ),
    );
  }
}
