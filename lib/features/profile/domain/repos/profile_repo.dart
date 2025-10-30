import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:bookia/features/profile/data/models/requests/update_info_request.dart';
import 'package:bookia/features/profile/data/models/responses/order_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<OrderResponse>>> getOrders();
  Future<Either<Failure, UserEntity>> updateInfo({
    required UpdateInfoRequest updateInfoRequest,
  });
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<Failure, void>> deleteAccount({required String password});
}
