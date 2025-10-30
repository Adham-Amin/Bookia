import 'package:bookia/features/profile/data/models/responses/order_response.dart';
import 'package:bookia/features/profile/domain/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  OrdersHistoryCubit({required this.profileRepo})
    : super(OrdersHistoryInitial());

  final ProfileRepo profileRepo;

  Future<void> getOrdersHistory() async {
    emit(OrdersHistoryLoading());
    var result = await profileRepo.getOrders();
    result.fold(
      (l) => emit(OrdersHistoryError(message: l.message)),
      (r) => emit(OrdersHistorySuccess(orders: r)),
    );
  }
}
