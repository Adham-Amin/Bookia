import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/features/auth/presentation/views/login_view.dart';
import 'package:bookia/features/auth/presentation/views/register_view.dart';
import 'package:bookia/features/welcome/presentation/view/welcome_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.welcomeView:
      return MaterialPageRoute(builder: (_) => const WelcomeView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (_) => const LoginView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
