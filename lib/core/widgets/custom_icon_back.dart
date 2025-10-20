import 'package:bookia/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconBack extends StatelessWidget implements PreferredSizeWidget {
  const CustomIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(AppAssets.svgsBack),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
