import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/utils/app_assets.dart';
import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/features/category/domain/repo/category_repo.dart';
import 'package:bookia/features/category/presentation/cubit/category_cubit.dart';
import 'package:bookia/features/category/presentation/widgets/category_view_body.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(categoryRepo: getIt<CategoryRepo>())
            ..getBookByCategory(id: category.id),
      child: Scaffold(
        appBar: AppBar(
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppAssets.svgsBack),
              ),
            ),
          ),
          title: Text(category.name, style: AppStyles.textRegular24),
        ),
        body: CategoryViewBody(),
      ),
    );
  }
}
