import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/models/request/login_request.dart';
import 'package:bookia/features/auth/data/models/request/register_request.dart';
import 'package:bookia/features/auth/data/models/request/reset_password_request.dart';
import 'package:bookia/features/auth/data/models/request/verify_code_request.dart';
import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> forgetPassword({
    required String email,
  }) async {
    try {
      var data = await authRemoteDataSource.forgetPassword(email: email);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      var data = await authRemoteDataSource.login(loginRequest: loginRequest);
      await Prefs.setUser(data.toEntity());
      await Prefs.setToken(data.token!);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      var data = await authRemoteDataSource.register(
        registerRequest: registerRequest,
      );
      await Prefs.setUser(data.toEntity());
      await Prefs.setToken(data.token!);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    try {
      var data = await authRemoteDataSource.resetPassword(
        resetPasswordRequest: resetPasswordRequest,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> verifyCode({
    required VerifyCodeRequest verifyCodeRequest,
  }) async {
    try {
      var data = await authRemoteDataSource.verifyCode(
        verifyCodeRequest: verifyCodeRequest,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
