part of 'verify_phone_cubit.dart';

@immutable
abstract class VerifyPhoneState {}

class VerifyPhoneInitial extends VerifyPhoneState {}

class VerifyPhoneLoading extends VerifyPhoneState {}

class VerifyPhoneSuccess extends VerifyPhoneState {
  final VerifyPhoneModel data;
  VerifyPhoneSuccess(this.data);
}

class VerifyPhoneFialure extends VerifyPhoneState {
  final String message;
  VerifyPhoneFialure(this.message);
}
