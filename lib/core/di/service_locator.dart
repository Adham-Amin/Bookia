import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/repos/auth_repo.dart';
import 'package:bookia/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:bookia/features/category/data/repos/category_repo_impl.dart';
import 'package:bookia/features/category/domain/repo/category_repo.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookia/features/home/data/repos/home_repo_impl.dart';
import 'package:bookia/features/home/domain/repos/home_repo.dart';
import 'package:bookia/features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'package:bookia/features/watchlist/data/repos/wishlist_repo_impl.dart';
import 'package:bookia/features/watchlist/domain/repos/wishlist_repo.dart';
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

  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(
      categoryRemoteDataSource: getIt<CategoryRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<LocalWishlistDataSource>(
    () => LocalWishlistDataSourceImpl(),
  );

  getIt.registerLazySingleton<WishlistRepo>(
    () => WishlistRepoImpl(
      localWatchlistDataSource: getIt<LocalWishlistDataSource>(),
    ),
  );
}
