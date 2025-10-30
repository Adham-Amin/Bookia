import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.profileRepo})
    : super(ChangePasswordInitial());

  final ProfileRepo profileRepo;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ChangePasswordLoading());
    var result = await profileRepo.changePassword(
      confirmPassword: confirmPassword,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    result.fold(
      (l) => emit(ChangePasswordError(message: l.message)),
      (r) => emit(ChangePasswordSuccess()),
    );
  }
}
