import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_info.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeightBox(16.h),
            ProfileInfo(),
            HeightBox(24.h),
            ProfileItem(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.orderView);
              },
              title: 'My Orders',
              icon: Icons.list,
            ),
            HeightBox(16.h),
            ProfileItem(onTap: () {}, title: 'Edit Profile', icon: Icons.edit),
            HeightBox(16.h),
            ProfileItem(
              onTap: () {},
              title: 'Change Password',
              icon: Icons.lock,
            ),
            HeightBox(16.h),
            ProfileItem(
              onTap: () {},
              title: 'FAQ',
              icon: Icons.question_answer,
            ),
            HeightBox(16.h),
            ProfileItem(
              onTap: () {},
              title: 'Privacy & Terms',
              icon: Icons.privacy_tip,
            ),
            HeightBox(16.h),
            ProfileItem(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.deleteAccountView);
              },
              title: 'Delete Account',
              icon: Icons.delete,
            ),
            HeightBox(16.h),
          ],
        ),
      ),
    );
  }
}
