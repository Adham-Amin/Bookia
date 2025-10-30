import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(AppAssets.svgsBack),
      ),
    ),
    centerTitle: true,
    title: Text(title, style: AppStyles.textRegular24),
  );
}
