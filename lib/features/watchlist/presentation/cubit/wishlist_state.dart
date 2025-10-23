import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WatchlistInitial extends WishlistState {}

class WatchlistLoading extends WishlistState {}

class WatchlistLoaded extends WishlistState {
  final List<BookEntity> watchlist;

  const WatchlistLoaded(this.watchlist);

  @override
  List<Object?> get props => [watchlist];
}

class WatchlistError extends WishlistState {
  final String message;

  const WatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}
