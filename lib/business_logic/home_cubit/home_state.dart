part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {
  final List<ProductModel> products;
  HomeSucessState(this.products);
}

class HomeFailureState extends HomeState {
  final String message;
  HomeFailureState(this.message);
}
