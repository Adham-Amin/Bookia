import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/auth/domain/entities/user_entity.dart';
import 'package:bookia/features/profile/data/models/requests/update_info_request.dart';
import 'package:bookia/features/profile/data/models/responses/order_response.dart';
import 'package:bookia/features/profile/data/models/responses/update_user_response.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<List<OrderResponse>> getOrders();
  Future<UserEntity> updateInfo({required UpdateInfoRequest updateInfoRequest});

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<void> deleteAccount({required String password});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    FormData data = FormData.fromMap({
      'current_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': confirmPassword,
    });

    await apiService.post(endPoint: '/update-password', data: data);
  }

  @override
  Future<void> deleteAccount({required String password}) async {
    FormData data = FormData.fromMap({'current_password': password});
    await apiService.post(endPoint: '/delete-profile', data: data);
  }

  @override
  Future<List<OrderResponse>> getOrders() async {
    var response = await apiService.get(endPoint: '/order-history');
    var orders = response['data']['orders'];
    List<OrderResponse> ordersList = [];
    for (var order in orders) {
      ordersList.add(OrderResponse.fromJson(order));
    }
    return ordersList;
  }

  @override
  Future<UserEntity> updateInfo({
    required UpdateInfoRequest updateInfoRequest,
  }) async {
    var response = await apiService.post(
      endPoint: '/update-profile',
      data: updateInfoRequest.toJson(),
    );

    return UpdateUserResponse.fromJson(response['data']).toEntity();
  }
}
