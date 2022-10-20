class LoginModel {
  final int status;
  final String message;
  final String code;
  const LoginModel({
    required this.code,
    required this.message,
    required this.status,
  });
}