import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());
}