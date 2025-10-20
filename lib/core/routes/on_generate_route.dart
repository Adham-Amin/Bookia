import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/features/welcome/presentation/view/welcome_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.welcomeView:
      return MaterialPageRoute(builder: (_) => const WelcomeView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
