import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_learn/bloc/auth/auth_bloc.dart';
import 'package:quick_learn/screens/forms/new_course_screen_form.dart';
import 'package:quick_learn/screens/home/homepage_screen.dart';
import 'package:quick_learn/screens/login/login_screen.dart';

typedef buildContext = Widget Function(BuildContext);

final routers = <String, buildContext>{
  'login': (context) => LoginScreen(),
  'home': (context) => HomepageScreen(),
};

abstract class Routing {}

class Router {
  static const Home = 'home';
  static const Login = 'login';
  static const NewCourse = 'newCourse';

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Router.Home:
        return goToPage(HomepageScreen());
        break;
      case Router.Login:
        return blocAuthBuilder(
          unauthenticatedWidget: LoginScreen(),
          authenticatedWidget: HomepageScreen(),
        );
        break;
      case Router.NewCourse:
        return goToPage(NewCourseScreenForm());
      default:
        return goToPage(LoginScreen());
    }
  }

  Route<dynamic> goToPage(
    Widget page, {
    BuildContext context,
    bool maintainState = true,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      maintainState: maintainState,
    );
  }

  Route<dynamic> blocAuthBuilder({
    @required Widget unauthenticatedWidget,
    @required Widget authenticatedWidget,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return authBuilder(
              unauthenticatedWidget: unauthenticatedWidget,
              authenticatedWidget: authenticatedWidget,
              state: state,
            );
          },
        );
      },
    );
  }

  Widget authBuilder({
    @required Widget unauthenticatedWidget,
    @required Widget authenticatedWidget,
    AuthState state,
  }) {
    switch (state.runtimeType) {
      case AuthInitial:
        return CircularProgressIndicator();
        break;
      case LoggedIn:
        return authenticatedWidget;
        break;
      case Authenticated:
        return authenticatedWidget;
        break;
      case Unauthenticated:
        return unauthenticatedWidget;
      default:
        return unauthenticatedWidget;
        break;
    }
  }
}
