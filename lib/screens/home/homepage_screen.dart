import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quick_learn/bloc/auth/auth_bloc.dart';
import 'package:quick_learn/screens/home/home_screen.dart';
import 'package:quick_learn/screens/my_courses/my_courses_screen.dart';
import 'package:quick_learn/widgets/bottom_nav_bar_primary.dart';
import 'package:quick_learn/widgets/upload_course.dart';

class HomepageScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final singleChildScrollController = useScrollController();

    final tickerProvider = useSingleTickerProvider();
    final tabController = useTabController(
      initialLength: 3,
      vsync: tickerProvider,
    );
    final showFloating = useState(true);
//    singleChildScrollController.addListener(() {
//      if (singleChildScrollController.position.userScrollDirection ==
//          ScrollDirection.reverse) {
//        // INFO : scroll down
//        showFloating.value = false;
//      } else {
//        // INFO : scroll up
//        showFloating.value = true;
//      }
//    });

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state.runtimeType);
        if (state is AuthInitial) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            'login',
            (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
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
                HomeScreen(
                  scrollController: singleChildScrollController,
                ),
                Container(
                  width: 300,
                  color: Colors.green,
                  child: Text('2'),
                ),
                MyCoursesScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
