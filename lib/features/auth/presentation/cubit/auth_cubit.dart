import 'package:bookia/features/auth/data/models/request/login_request.dart';
import 'package:bookia/features/auth/data/models/request/register_request.dart';
import 'package:bookia/features/auth/data/models/request/reset_password_request.dart';
import 'package:bookia/features/auth/data/models/request/verify_code_request.dart';
import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(AuthLoading());
    final result = await authRepo.login(loginRequest: loginRequest);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> register({required RegisterRequest registerRequest}) async {
    emit(AuthLoading());
    final result = await authRepo.register(registerRequest: registerRequest);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> forgetPassword({required String email}) async {
    emit(AuthLoading());
    final result = await authRepo.forgetPassword(email: email);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> verifyCode({
    required VerifyCodeRequest verifyCodeRequest,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.verifyCode(
      verifyCodeRequest: verifyCodeRequest,
    );
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess()),
    );
  }

  Future<void> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.resetPassword(
      resetPasswordRequest: resetPasswordRequest,
    );
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess()),
    );
  }
}
