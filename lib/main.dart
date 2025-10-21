import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/functions/execute_to_navigator.dart';
import 'package:bookia/core/functions/theme_dark.dart';
import 'package:bookia/core/functions/theme_light.dart';
import 'package:bookia/core/routes/on_generate_route.dart';
import 'package:bookia/core/services/custom_observer_bloc.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serverLocator();
  await Prefs.init();
  Bloc.observer = CustomObserverBloc();
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
          initialRoute: executeToNavigator(),
        );
      },
    );
  }
}
