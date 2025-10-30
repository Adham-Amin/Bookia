part of 'update_info_cubit.dart';

sealed class UpdateInfoState extends Equatable {
  const UpdateInfoState();

  @override
  List<Object> get props => [];
}

final class UpdateInfoInitial extends UpdateInfoState {}

final class UpdateInfoLoading extends UpdateInfoState {}

final class UpdateInfoSuccess extends UpdateInfoState {
  final UserEntity user;
  const UpdateInfoSuccess({required this.user});
}

final class UpdateInfoError extends UpdateInfoState {
  final String message;
  const UpdateInfoError({required this.message});
}
