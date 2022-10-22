import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/screens/shared/help_screen.dart';
import '../../presentation/screens/shared/home_screen.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  List<String> titles = [
    'Help',
    'Notification',
    '',
    'Favourites',
    'Exit',
  ];

  List<Widget> screens = const [
    HelpScreen(),
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

  List<int> ids = [];
  void addToSelectedIds(int id) {
    ids.add(id);
    emit(AddToSelectedItemsState());
  }

  void remvoeFromSelectedIds(int id) {
    ids.remove(id);
    emit(RemoveFromSelectedItemsState());
  }
}
