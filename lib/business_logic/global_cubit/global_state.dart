part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class ChangeBottomNavState extends GlobalState {}

class AddToSelectedItemsState extends GlobalState {}

class RemoveFromSelectedItemsState extends GlobalState {}

class SelectedCatState extends GlobalState {}
