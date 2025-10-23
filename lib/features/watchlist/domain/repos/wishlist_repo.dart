import 'package:bookia/features/home/domain/entities/book_entity.dart';

abstract class WishlistRepo {
  Future<void> addToWatchlist({required BookEntity product});
  Future<void> removeFromWatchlist({required BookEntity product});
  Future<bool> isProductInWatchlist({required num productId});
  Future<List<BookEntity>> getWatchlist();
}
