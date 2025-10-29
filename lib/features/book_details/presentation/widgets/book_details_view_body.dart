import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/book_details/presentation/widgets/image_section.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightBox(24),
            ImageSection(book: book),
            HeightBox(24),
            Text(
              book.title!,
              textAlign: TextAlign.center,
              style: AppStyles.textRegular30,
            ),
            HeightBox(8),
            Text(
              book.category!,
              style: AppStyles.textRegular16.copyWith(color: AppColors.primary),
            ),
            HeightBox(24),
            Text(
              book.description!,
              style: AppStyles.textRegular12,
              textAlign: TextAlign.justify,
            ),
            HeightBox(16),
          ],
        ),
      ),
    );
  }
}
