import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';

String executeToNavigator() {
  final user = Prefs.getUser();
  return user != null ? AppRoutes.mainView : AppRoutes.welcomeView;
}
