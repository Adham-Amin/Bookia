class ResetPasswordRequest {
  num verifyCode;
  String newPassword;
  String newPasswordConfirmation;

  ResetPasswordRequest({
    required this.verifyCode,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequest(
      verifyCode: json['verify_code'] as num,
      newPassword: json['new_password'] as String,
      newPasswordConfirmation: json['new_password_confirmation'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'verify_code': verifyCode,
    'new_password': newPassword,
    'new_password_confirmation': newPasswordConfirmation,
  };
}
