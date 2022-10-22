import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/screens/shared/home_screen.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<Widget> screens = const [
    Center(
      child: Text('Help'),
    ),
    Center(
      child: Text('notification'),
    ),
    HomeScreen(),
    Center(
      child: Text('favs'),
    ),
    Center(
      child: Text('exit'),
    ),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

}
