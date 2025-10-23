import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:bookia/features/home/domain/entities/slider_entity.dart';
import 'package:bookia/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> getBestSellers() async {
    try {
      var data = await homeRemoteDataSource.getBestSellers();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getBookCategories({
    required int id,
  }) async {
    try {
      var data = await homeRemoteDataSource.getBookCategories(id: id);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      var data = await homeRemoteDataSource.getCategories();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getNewArrivals() async {
    try {
      var data = await homeRemoteDataSource.getNewArrivals();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<SliderEntity>>> getSliders() async {
    try {
      var data = await homeRemoteDataSource.getSliders();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
