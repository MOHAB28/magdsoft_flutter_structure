import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/models/help_model.dart';
import '../../data/network/responses/help_response.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());

  static HelpCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getHelpData() async {
    try {
      emit(HelpLoadingState());
      final response = await DioHelper.getData(
        url: '$api$getHelpEndPoint',
        query: {},
      );
      if (response.statusCode == 200) {
        HelpResponse helpResponse = HelpResponse.fromJson(response.data);
        if (helpResponse.status == 200) {
          debugPrint(helpResponse.status.toString());
          emit(HelpSucessState([...helpResponse.itemsR!]));
        } else {
          emit(HelpFailureState(helpResponse.message));
        }
      }
    } on DioError {
      debugPrint('error from dio');
      emit(HelpFailureState(''));
    } catch (e) {
      debugPrint(e.toString());
      emit(HelpFailureState(''));
    }
  }
}
