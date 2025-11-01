part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class ChecoutLoading extends CheckoutState {}

final class ChecoutSuccess extends CheckoutState {}

final class ChecoutError extends CheckoutState {
  final String message;
  ChecoutError({required this.message});
}
