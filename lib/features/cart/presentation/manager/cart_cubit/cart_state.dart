part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartEntity cart;
  const CartSuccess({required this.cart});
}

final class CartError extends CartState {
  final String message;
  const CartError({required this.message});
}
