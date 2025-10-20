import 'package:bookia/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
