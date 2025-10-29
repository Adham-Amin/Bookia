import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchNow extends StatelessWidget {
  const SearchNow({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.svgsIconSearch, height: 80.h),
        HeightBox(12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textRegular24,
        ),
        HeightBox(24),
      ],
    );
  }
}
