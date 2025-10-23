import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/watchlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavList extends StatelessWidget {
  const FavList({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 24.h),
      itemCount: books.length,
      separatorBuilder: (context, index) =>
          Divider(color: AppColors.grey, height: 32.h),
      itemBuilder: (context, index) => WishlistCard(book: books[index]),
    );
  }
}
