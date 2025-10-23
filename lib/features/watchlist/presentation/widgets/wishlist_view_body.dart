import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/watchlist/presentation/cubit/wishlist_state.dart';
import 'package:bookia/features/watchlist/presentation/widgets/fav_is_empty.dart';
import 'package:bookia/features/watchlist/presentation/widgets/fav_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<WishlistCubit, WishlistState>(
              builder: (context, state) {
                if (state is WatchlistLoaded) {
                  if (state.watchlist.isEmpty) {
                    return FavIsEmpty();
                  }
                  return FavList(books: state.watchlist);
                } else if (state is WatchlistError) {
                  return Center(
                    child: Text(state.message, style: AppStyles.textRegular16),
                  );
                } else {
                  return FavIsEmpty();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
