class VerifyPhoneModel {
  final int status;
  final String message;
  final dynamic account;
  const VerifyPhoneModel({
    required this.account,
    required this.message,
    required this.status,
  });
}

class AccountModel {
  final int id;
  final String name;
  final String phone;
  const AccountModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}