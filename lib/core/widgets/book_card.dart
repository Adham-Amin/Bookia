import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/wishlist_button.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.bookDetailsView,
        arguments: book,
      ),
      child: Container(
        width: 160.w,
        height: 300.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.primary : AppColors.bgLight,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: book.image == ''
                    ? Image.asset(
                        AppAssets.imagesBgWelcome,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Image.network(
                        book.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
              ),
            ),
            HeightBox(8),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? '     ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textRegular16,
                  ),
                  HeightBox(4),
                  Text(
                    book.category ?? '     ',
                    style: AppStyles.textRegular12.copyWith(
                      color: isDark ? AppColors.white : AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(
                    '\$${book.priceAfterDiscount ?? '    '}',
                    style: AppStyles.textRegular16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  WishlistButton(book: book),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
