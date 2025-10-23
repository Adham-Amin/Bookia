import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookia/features/home/data/repos/home_repo_impl.dart';
import 'package:bookia/features/home/domain/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );
}
