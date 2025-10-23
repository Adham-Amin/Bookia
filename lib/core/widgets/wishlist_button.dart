import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/watchlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistButton extends StatelessWidget {
  const WishlistButton({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final isInWatchlist =
            state is WatchlistLoaded && state.watchlist.contains(book);
        return GestureDetector(
          onTap: () {
            context.read<WishlistCubit>().toggleWatchlist(book);
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              isInWatchlist ? Icons.favorite : Icons.favorite_border,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
