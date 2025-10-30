import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({required this.profileRepo})
    : super(DeleteAccountInitial());

  final ProfileRepo profileRepo;

  Future<void> deleteAccount({required String password}) async {
    emit(DeleteAccountLoading());
    var result = await profileRepo.deleteAccount(password: password);
    result.fold(
      (l) => emit(DeleteAccountError(message: l.message)),
      (r) => emit(DeleteAccountSuccess()),
    );
  }
}
