import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:bookia/features/category/domain/repo/category_repo.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepoImpl extends CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepoImpl({required this.categoryRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> getBookByCategory({
    required num id,
  }) async {
    try {
      var data = await categoryRemoteDataSource.getBookCategories(id: id);
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
