import 'package:bookia/core/functions/theme_dark.dart';
import 'package:bookia/core/functions/theme_light.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/routes/on_generate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Bookia());
}

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: themeLight(),
          darkTheme: themeDark(),
          onGenerateRoute: onGenerateRoute,
          initialRoute: AppRoutes.welcomeView,
        );
      },
    );
  }
}
