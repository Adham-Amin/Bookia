import 'package:bookia/core/services/api_service.dart';
import 'package:bookia/features/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/model/request/place_order_request.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> getCart();
  Future<CartResponse> addToCart({required num bookId});
  Future<CartResponse> removeFromCart({required num bookId});
  Future<CartResponse> updateCart({required num bookId, required num quantity});

  Future<void> checkout();
  Future<void> placeOrder({required PlaceOrderRequest placeOrderRequest});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;
  CartRemoteDataSourceImpl({required this.apiService});

  @override
  Future<CartResponse> addToCart({required num bookId}) async {
    var response = await apiService.post(
      endPoint: '/add-to-cart',
      data: {'product_id': bookId},
    );
    return CartResponse.fromJson(response['data']);
  }

  @override
  Future<CartResponse> getCart() async {
    var response = await apiService.get(endPoint: '/cart');
    return CartResponse.fromJson(response['data']);
  }

  @override
  Future<CartResponse> removeFromCart({required num bookId}) async {
    var response = await apiService.post(
      endPoint: '/remove-from-cart',
      data: {'cart_item_id': bookId},
    );
    return CartResponse.fromJson(response['data']);
  }

  @override
  Future<CartResponse> updateCart({
    required num bookId,
    required num quantity,
  }) async {
    var response = await apiService.post(
      endPoint: '/update-cart',
      data: {'cart_item_id': bookId, 'quantity': quantity},
    );
    return CartResponse.fromJson(response['data']);
  }

  @override
  Future<void> checkout() async {
    await apiService.get(endPoint: '/checkout');
  }

  @override
  Future<void> placeOrder({required PlaceOrderRequest placeOrderRequest}) {
    return apiService.post(
      endPoint: '/place-order',
      data: placeOrderRequest.toJson(),
    );
  }
}
