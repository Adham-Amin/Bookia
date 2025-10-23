import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalWishlistDataSource {
  Future<void> addToWatchlist({required BookEntity product});
  Future<void> removeFromWatchlist({required BookEntity product});
  Future<bool> isProductInWatchlist({required num productId});
  Future<List<BookEntity>> getWatchlist();
}

class LocalWishlistDataSourceImpl extends LocalWishlistDataSource {
  @override
  Future<void> addToWatchlist({required BookEntity product}) async {
    final watchlistBox = Hive.box<BookEntity>('watchlist');
    await watchlistBox.put(product.id, product);
  }

  @override
  Future<void> removeFromWatchlist({required BookEntity product}) async {
    final watchlistBox = Hive.box<BookEntity>('watchlist');
    await watchlistBox.delete(product.id);
  }

  @override
  Future<bool> isProductInWatchlist({required num productId}) async {
    final watchlistBox = Hive.box<BookEntity>('watchlist');
    return watchlistBox.containsKey(productId);
  }

  @override
  Future<List<BookEntity>> getWatchlist() async {
    final watchlistBox = Hive.box<BookEntity>('watchlist');
    return watchlistBox.values.toList();
  }
}
