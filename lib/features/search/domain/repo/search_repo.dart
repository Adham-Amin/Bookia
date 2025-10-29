import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
  });
}
