import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: CachedNetworkImage(
        imageUrl: book.image!,
        height: 280.h,
        width: 180.w,
        fit: BoxFit.cover,
        placeholder: (context, url) => Skeletonizer(
          enabled: true,
          child: Image.asset(AppAssets.imagesBgWelcome, fit: BoxFit.cover),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
