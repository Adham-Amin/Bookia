import 'package:bookia/features/cart/data/model/request/place_order_request.dart';
import 'package:bookia/features/cart/domain/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.cartRepo}) : super(CheckoutInitial());

  final CartRepo cartRepo;

  Future<void> checkout() async {
    emit(ChecoutLoading());
    final result = await cartRepo.checkout();
    result.fold(
      (failure) => emit(ChecoutError(message: failure.message)),
      (_) => emit(ChecoutSuccess()),
    );
  }

  Future<void> placeOrder({
    required PlaceOrderRequest placeOrderRequest,
  }) async {
    emit(ChecoutLoading());
    final result = await cartRepo.placeOrder(
      placeOrderRequest: placeOrderRequest,
    );
    result.fold(
      (failure) => emit(ChecoutError(message: failure.message)),
      (_) => emit(ChecoutSuccess()),
    );
  }
}
