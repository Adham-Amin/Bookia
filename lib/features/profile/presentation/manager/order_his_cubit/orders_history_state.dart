part of 'orders_history_cubit.dart';

sealed class OrdersHistoryState extends Equatable {
  const OrdersHistoryState();

  @override
  List<Object> get props => [];
}

final class OrdersHistoryInitial extends OrdersHistoryState {}

final class OrdersHistoryLoading extends OrdersHistoryState {}

final class OrdersHistorySuccess extends OrdersHistoryState {
  final List<OrderResponse> orders;
  const OrdersHistorySuccess({required this.orders});
}

final class OrdersHistoryError extends OrdersHistoryState {
  final String message;
  const OrdersHistoryError({required this.message});
}
