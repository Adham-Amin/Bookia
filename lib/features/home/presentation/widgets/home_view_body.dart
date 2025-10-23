import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_list.dart';
import 'package:bookia/features/home/presentation/widgets/categories_section.dart';
import 'package:bookia/features/home/presentation/widgets/new_arrivals_list.dart';
import 'package:bookia/features/home/presentation/widgets/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          if (state is HomeError) {
            return Center(
              child: Text(state.message, style: AppStyles.textRegular14),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Skeletonizer(
              enabled: state is HomeLoading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SliderSection(sliders: cubit.sliders),
                  HeightBox(16),
                  CategoriesSection(categories: cubit.categories),
                  HeightBox(24),
                  BestSellerList(books: cubit.bestSellers),
                  HeightBox(24),
                  NewArrivalsList(books: cubit.newArrivals),
                  HeightBox(24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
