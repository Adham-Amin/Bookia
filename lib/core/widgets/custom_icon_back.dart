import 'package:bookia/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconBack extends StatelessWidget implements PreferredSizeWidget {
  const CustomIconBack({super.key, this.action});

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(AppAssets.svgsBack),
      ),
      actions: [action ?? const SizedBox(), const SizedBox(width: 16)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
