import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/watchlist/domain/repos/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo wishlistRepo;

  WishlistCubit({required this.wishlistRepo}) : super(WatchlistInitial());

  Future<void> loadWatchlist() async {
    emit(WatchlistLoading());
    try {
      final watchlist = await wishlistRepo.getWatchlist();
      emit(WatchlistLoaded(watchlist));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> toggleWatchlist(BookEntity product) async {
    try {
      final isInWatchlist = await wishlistRepo.isProductInWatchlist(
        productId: product.id!,
      );
      if (isInWatchlist) {
        await wishlistRepo.removeFromWatchlist(product: product);
      } else {
        await wishlistRepo.addToWatchlist(product: product);
      }
      await loadWatchlist();
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
}
