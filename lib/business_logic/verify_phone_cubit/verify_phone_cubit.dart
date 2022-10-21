import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/network/responses/verify_phone_response.dart';
import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/models/verify_phone_model.dart';
import '../../data/network/requests/verify_phone_request.dart';

part 'verify_phone_state.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  VerifyPhoneCubit() : super(VerifyPhoneInitial());

  static VerifyPhoneCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> sendOtp(VerifyPhoneRequest request) async {
    try {
      emit(VerifyPhoneLoading());
      final response = await DioHelper.postData(
        url: otpEndPoint,
        body: {
          'code': request.code,
          'phone': request.phone,
        },
      );
      if (response.statusCode == 200) {
        VerifyPhoneRespone verifyResponse = VerifyPhoneRespone.fromJson(response.data);
        if (verifyResponse.status == 200) {
          emit(VerifyPhoneSuccess(verifyResponse));
        } else {
          emit(VerifyPhoneFialure(verifyResponse.message));
        }
      }
    } on DioError {
      debugPrint('error from dio');
      emit(VerifyPhoneFialure(''));
    } catch (e) {
      debugPrint(e.toString());
      emit(VerifyPhoneFialure(''));
    }
  }
}
