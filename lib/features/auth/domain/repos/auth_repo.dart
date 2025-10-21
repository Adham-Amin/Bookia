import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/auth/data/models/request/login_request.dart';
import 'package:bookia/features/auth/data/models/request/register_request.dart';
import 'package:bookia/features/auth/data/models/request/reset_password_request.dart';
import 'package:bookia/features/auth/data/models/request/verify_code_request.dart';
import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest registerRequest,
  });

  Future<Either<Failure, UserEntity>> login({
    required LoginRequest loginRequest,
  });

  Future<Either<Failure, UserEntity>> forgetPassword({required String email});
  Future<Either<Failure, void>> verifyCode({
    required VerifyCodeRequest verifyCodeRequest,
  });

  Future<Either<Failure, void>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  });
}
