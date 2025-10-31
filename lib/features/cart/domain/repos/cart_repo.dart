import 'package:bookia/core/errors/failure.dart';
import 'package:bookia/features/cart/domain/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> addToCart({required num bookId});
  Future<Either<Failure, CartEntity>> removeFromCart({required num bookId});
  Future<Either<Failure, CartEntity>> updateCart({
    required num bookId,
    required num quantity,
  });
}
