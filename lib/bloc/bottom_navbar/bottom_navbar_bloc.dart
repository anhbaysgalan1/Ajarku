import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class BottomNavbarBloc extends Cubit<int> {
  BottomNavbarBloc() : super(0);

  void switchTab(index) {
    // do logic on each tab if necessary
    switch (index) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        break;
    }
    emit(index);
  }
}
