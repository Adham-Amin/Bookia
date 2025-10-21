import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/success_view.dart';
import 'package:bookia/features/auth/presentation/views/forget_password_view.dart';
import 'package:bookia/features/auth/presentation/views/login_view.dart';
import 'package:bookia/features/auth/presentation/views/new_password_view.dart';
import 'package:bookia/features/auth/presentation/views/otp_view.dart';
import 'package:bookia/features/auth/presentation/views/register_view.dart';
import 'package:bookia/features/main/main_view.dart';
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
    case AppRoutes.forgotPasswordView:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    case AppRoutes.otpView:
      return MaterialPageRoute(
        builder: (_) => OtpView(email: settings.arguments as String),
      );
    case AppRoutes.newPasswordView:
      return MaterialPageRoute(
        builder: (_) => NewPasswordView(code: settings.arguments as num),
      );
    case AppRoutes.successView:
      var args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => SuccessView(
          headerTitle: args['headerTitle'],
          subTitle: args['subTitle'],
          buttonTitle: args['buttonTitle'],
          nextRoute: args['nextRoute'],
        ),
      );
    case AppRoutes.mainView:
      return MaterialPageRoute(builder: (_) => const MainView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
