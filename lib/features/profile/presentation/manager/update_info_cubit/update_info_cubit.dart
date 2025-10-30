import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:bookia/features/profile/data/models/requests/update_info_request.dart';
import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit({required this.profileRepo}) : super(UpdateInfoInitial());

  final ProfileRepo profileRepo;

  Future<void> updateUserInfo({
    required UpdateInfoRequest updateInfoRequest,
  }) async {
    emit(UpdateInfoLoading());
    var result = await profileRepo.updateInfo(
      updateInfoRequest: updateInfoRequest,
    );
    result.fold(
      (l) => emit(UpdateInfoError(message: l.message)),
      (r) => emit(UpdateInfoSuccess(user: r)),
    );
  }
}
