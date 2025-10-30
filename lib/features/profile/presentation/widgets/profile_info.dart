import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Prefs.getUser();
    return Row(
      children: [
        HeightBox(16.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CachedNetworkImage(
            imageUrl:
                user?.image ??
                'https://cdn-icons-png.flaticon.com/512/149/149071.png',
            fit: BoxFit.cover,
            width: 100.w,
            height: 100.h,
          ),
        ),
        WidthBox(16.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user?.name ?? '', style: AppStyles.textRegular20),
              HeightBox(8.h),
              Text(
                user?.email ?? '',
                style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
