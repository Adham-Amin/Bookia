import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:bookia/features/cart/domain/entities/cart_entity.dart';
import 'package:bookia/features/cart/domain/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, CartEntity>> addToCart({required num bookId}) async {
    try {
      var data = await cartRemoteDataSource.addToCart(bookId: bookId);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      var data = await cartRemoteDataSource.getCart();
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartEntity>> removeFromCart({
    required num bookId,
  }) async {
    try {
      var data = await cartRemoteDataSource.removeFromCart(bookId: bookId);
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateCart({
    required num bookId,
    required num quantity,
  }) async {
    try {
      var data = await cartRemoteDataSource.updateCart(
        bookId: bookId,
        quantity: quantity,
      );
      return right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
