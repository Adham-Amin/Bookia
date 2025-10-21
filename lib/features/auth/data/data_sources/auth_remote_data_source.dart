import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/auth/data/models/request/login_request.dart';
import 'package:bookia/features/auth/data/models/request/register_request.dart';
import 'package:bookia/features/auth/data/models/request/reset_password_request.dart';
import 'package:bookia/features/auth/data/models/request/verify_code_request.dart';
import 'package:bookia/features/auth/data/models/responses/auth_response/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> register({required RegisterRequest registerRequest});

  Future<AuthResponse> login({required LoginRequest loginRequest});

  Future<AuthResponse> forgetPassword({required String email});
  Future<void> verifyCode({required VerifyCodeRequest verifyCodeRequest});

  Future<void> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<AuthResponse> forgetPassword({required String email}) async {
    var response = await apiService.post(
      endPoint: '/forget-password',
      data: {'email': email},
    );
    return AuthResponse.fromJson(response['data']);
  }

  @override
  Future<AuthResponse> login({required LoginRequest loginRequest}) async {
    final response = await apiService.post(
      endPoint: '/login',
      data: loginRequest.toJson(),
    );
    return AuthResponse.fromJson(response['data']);
  }

  @override
  Future<AuthResponse> register({
    required RegisterRequest registerRequest,
  }) async {
    final response = await apiService.post(
      endPoint: '/register',
      data: registerRequest.toJson(),
    );
    return AuthResponse.fromJson(response['data']);
  }

  @override
  Future<void> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    await apiService.post(
      endPoint: '/reset-password',
      data: resetPasswordRequest.toJson(),
    );
  }

  @override
  Future<void> verifyCode({
    required VerifyCodeRequest verifyCodeRequest,
  }) async {
    await apiService.post(
      endPoint: '/check-forget-password',
      data: verifyCodeRequest.toJson(),
    );
  }
}
