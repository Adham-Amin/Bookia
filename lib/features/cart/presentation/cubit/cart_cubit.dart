import 'package:bookia/features/cart/domain/entities/cart_entity.dart';
import 'package:bookia/features/cart/domain/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());

  final CartRepo cartRepo;

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await cartRepo.getCart();
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartSuccess(cart: cart)),
    );
  }

  Future<void> addToCart({required num bookId}) async {
    emit(CartLoading());
    final result = await cartRepo.addToCart(bookId: bookId);
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartSuccess(cart: cart)),
    );
  }

  Future<void> removeFromCart({required num bookId}) async {
    emit(CartLoading());
    final result = await cartRepo.removeFromCart(bookId: bookId);
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartSuccess(cart: cart)),
    );
  }

  Future<void> updateCart({required num bookId, required num quantity}) async {
    final result = await cartRepo.updateCart(
      bookId: bookId,
      quantity: quantity,
    );
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartSuccess(cart: cart)),
    );
  }
}
