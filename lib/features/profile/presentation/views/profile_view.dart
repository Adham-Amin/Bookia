import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Profile', style: AppStyles.textRegular24),
        actions: [
          IconButton(
            onPressed: () {
              Prefs.clearUserData();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.welcomeView,
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const ProfileViewBody(),
    );
  }
}
