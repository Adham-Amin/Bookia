import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/widgets/success_view.dart';
import 'package:bookia/features/auth/presentation/views/forget_password_view.dart';
import 'package:bookia/features/auth/presentation/views/login_view.dart';
import 'package:bookia/features/auth/presentation/views/new_password_view.dart';
import 'package:bookia/features/auth/presentation/views/otp_view.dart';
import 'package:bookia/features/auth/presentation/views/register_view.dart';
import 'package:bookia/features/books/presentation/views/books_view.dart';
import 'package:bookia/features/category/presentation/views/category_view.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:bookia/features/main/main_view.dart';
import 'package:bookia/features/search/presentation/views/search_view.dart';
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
    case AppRoutes.booksView:
      var args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => BooksView(title: args['title'], books: args['books']),
      );
    case AppRoutes.categoryView:
      return MaterialPageRoute(
        builder: (_) =>
            CategoryView(category: settings.arguments as CategoryEntity),
      );
    case AppRoutes.searchView:
      return MaterialPageRoute(builder: (_) => SearchView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
