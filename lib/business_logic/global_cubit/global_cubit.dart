import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/screens/shared/help_screen.dart';
import '../../presentation/screens/shared/home_screen.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  // Bottom nav current index
  int currentIndex = 2;

  // Bottom nav app bar titles
  List<String> titles = [
    'Help',
    'Notification',
    '',
    'Favourites',
    'Exit',
  ];

  // Bottom nav views
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

  // Change bottom nav index
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  // Handle help card buttton onTap at help view
  // add the id of selected card to open it
  List<int> ids = [];
  void addToSelectedIds(int id) {
    ids.add(id);
    emit(AddToSelectedItemsState());
  }

  // remove the id of selected card to close it
  void remvoeFromSelectedIds(int id) {
    ids.remove(id);
    emit(RemoveFromSelectedItemsState());
  }

  // Handle the selected category button onTap at home view.
  // when user pressed the button this method remove all items then
  // add the selected name 
  List<String> names = ['All'];
  void addToSelectedNames(String name) {
    names = [];
    names.add(name);
    emit(SelectedCatState());
  }
}
