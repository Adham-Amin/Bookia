import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookia/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
  }) async {
    try {
      final books = await searchRemoteDataSource.getSearchResult(query: query);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
