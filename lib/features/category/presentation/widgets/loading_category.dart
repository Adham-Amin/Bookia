import 'package:bookia/core/widgets/book_card.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingCategory extends StatelessWidget {
  const LoadingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.52,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => BookCard(
            book: BookEntity(
              title: '      ',
              category: '      ',
              priceAfterDiscount: 1111,
            ),
          ),
        ),
      ),
    );
  }
}
