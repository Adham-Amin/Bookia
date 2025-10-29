import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/core/widgets/wishlist_button.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.book});

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
        height: 140.h,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.primary : AppColors.bgLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                book.image ?? '',
                fit: BoxFit.cover,
                width: 100.h,
                height: 120.h,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.broken_image,
                  size: 100.h,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? 'No Title',
                    style: AppStyles.textRegular18,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  HeightBox(8),
                  Text(
                    book.category ?? 'Unknown',
                    style: AppStyles.textRegular14.copyWith(
                      color: isDark ? AppColors.white : AppColors.grey,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '\$${book.price ?? '0'}',
                        style: AppStyles.textRegular16,
                      ),
                      const Spacer(),
                      WishlistButton(book: book),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
