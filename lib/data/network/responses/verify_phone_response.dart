import '../../models/verify_phone_model.dart';

class VerifyPhoneRespone extends VerifyPhoneModel {
  final dynamic accountR;
  VerifyPhoneRespone({
    int? status,
    String? message,
    this.accountR,
  }) : super(
          account: accountR!,
          message: message!,
          status: status!,
        );

  factory VerifyPhoneRespone.fromJson(Map<String, dynamic> json) {
    return VerifyPhoneRespone(
      message: json['message'],
      status: json['status'],
      accountR: json['account'] != null
      ? AccountResponse.fromJson(json['account'])
      : null, 
    );
  }
}

class AccountResponse extends AccountModel {
  AccountResponse({
    int? id,
    String? name,
    String? phone,
  }) : super(
          id: id!,
          name: name!,
          phone: phone!,
        );

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
