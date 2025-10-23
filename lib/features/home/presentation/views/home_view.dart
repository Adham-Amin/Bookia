import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/domain/repos/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) =>
          HomeCubit(homeRepo: getIt<HomeRepo>())..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            AppAssets.svgsLogo,
            colorFilter: isDark
                ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                : null,
            height: 30.h,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.svgsIconSearch,
                colorFilter: ColorFilter.mode(
                  isDark ? AppColors.white : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
