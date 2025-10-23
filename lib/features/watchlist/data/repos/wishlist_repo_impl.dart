import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'package:bookia/features/watchlist/domain/repos/wishlist_repo.dart';

class WishlistRepoImpl extends WishlistRepo {
  final LocalWishlistDataSource localWatchlistDataSource;

  WishlistRepoImpl({required this.localWatchlistDataSource});
  @override
  Future<void> addToWatchlist({required BookEntity product}) async {
    final isInWatchlist = await localWatchlistDataSource.isProductInWatchlist(
      productId: product.id!,
    );
    if (isInWatchlist) return;
    await localWatchlistDataSource.addToWatchlist(product: product);
  }

  @override
  Future<List<BookEntity>> getWatchlist() async {
    var products = await localWatchlistDataSource.getWatchlist();
    return products;
  }

  @override
  Future<bool> isProductInWatchlist({required num productId}) async {
    return await localWatchlistDataSource.isProductInWatchlist(
      productId: productId,
    );
  }

  @override
  Future<void> removeFromWatchlist({required BookEntity product}) async {
    await localWatchlistDataSource.removeFromWatchlist(product: product);
  }
}
