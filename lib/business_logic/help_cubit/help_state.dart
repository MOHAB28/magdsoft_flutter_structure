part of 'help_cubit.dart';

@immutable
abstract class HelpState {}

class HelpInitial extends HelpState {}

class HelpLoadingState extends HelpState {}

class HelpSucessState extends HelpState {
  final List<HelpItems> products;
  HelpSucessState(this.products);
}

class HelpFailureState extends HelpState {
  final String message;
  HelpFailureState(this.message);
}