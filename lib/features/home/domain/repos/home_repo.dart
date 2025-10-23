import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:bookia/features/home/domain/entities/slider_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SliderEntity>>> getSliders();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<BookEntity>>> getBookCategories({
    required int id,
  });
  Future<Either<Failure, List<BookEntity>>> getBestSellers();
  Future<Either<Failure, List<BookEntity>>> getNewArrivals();
}
