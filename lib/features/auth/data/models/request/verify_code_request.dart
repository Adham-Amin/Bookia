class VerifyCodeRequest {
  String email;
  num verifyCode;

  VerifyCodeRequest({required this.email, required this.verifyCode});

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) {
    return VerifyCodeRequest(
      email: json['email'] as String,
      verifyCode: json['verify_code'] as num,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'verify_code': verifyCode};
}
