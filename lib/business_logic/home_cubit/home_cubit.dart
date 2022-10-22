import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/models/home_model.dart';
import '../../data/network/responses/home_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    try {
      emit(HomeLoadingState());
      final response = await DioHelper.getData(
        url: '$api$getProductsEndPoint',
        query: {},
      );
      if (response.statusCode == 200) {
        HomeResponse homeResponse = HomeResponse.fromJson(response.data);
        if (homeResponse.status == 200) {
          debugPrint(homeResponse.status.toString());
          emit(HomeSucessState([...homeResponse.productR!]));
        } else {
          emit(HomeFailureState(homeResponse.message));
        }
      }
    } on DioError {
      debugPrint('error from dio');
      emit(HomeFailureState(''));
    } catch (e) {
      debugPrint(e.toString());
      emit(HomeFailureState(''));
    }
  }
}
