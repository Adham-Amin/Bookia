import 'package:bookia/core/utils/app_styles.dart';
import 'package:bookia/core/widgets/height_and_width.dart';
import 'package:bookia/features/home/domain/entities/category_entity.dart';
import 'package:bookia/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: AppStyles.textRegular24),
        HeightBox(8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((e) => CategoryItem(category: e)).toList(),
          ),
        ),
      ],
    );
  }
}
