import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/functions/execute_to_navigator.dart';
import 'package:bookia/core/functions/theme_dark.dart';
import 'package:bookia/core/functions/theme_light.dart';
import 'package:bookia/core/routes/on_generate_route.dart';
import 'package:bookia/core/services/custom_observer_bloc.dart';
import 'package:bookia/core/services/shared_preferences_service.dart';
import 'package:bookia/features/cart/domain/repos/cart_repo.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:bookia/features/home/domain/entities/book_entity.dart';
import 'package:bookia/features/watchlist/domain/repos/wishlist_repo.dart';
import 'package:bookia/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serverLocator();
  await Prefs.init();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('watchlist');
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  WishlistCubit(wishlistRepo: getIt<WishlistRepo>())
                    ..loadWatchlist(),
            ),
            BlocProvider(
              create: (context) =>
                  CartCubit(cartRepo: getIt<CartRepo>())..getCart(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme: themeLight(),
            darkTheme: themeDark(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: executeToNavigator(),
          ),
        );
      },
    );
  }
}
